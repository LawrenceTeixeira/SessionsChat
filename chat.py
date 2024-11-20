import streamlit as st
import os
import sys
from dotenv import load_dotenv
import logging
from utilities import get_similar_sessions
from langchain_openai import ChatOpenAI
from langchain.prompts import ChatPromptTemplate
from langchain.schema import StrOutputParser
from langchain.schema.runnable import Runnable
from langchain.schema.runnable.config import RunnableConfig
from langchain_core.runnables import RunnableLambda
from langchain_core.runnables import RunnablePassthrough
import getpass

logging.basicConfig(level=logging.INFO)

# Adicionando o diretório pai ao caminho
sys.path.append(os.path.abspath('..'))

# Carrega as variáveis de ambiente do arquivo .env
load_dotenv()

if not os.environ.get("OPENAI_API_KEY"):
    os.environ["OPENAI_API_KEY"] = getpass.getpass("Enter your OpenAI API key: ")

MODELO = ""

prompt = ChatPromptTemplate.from_messages(
    [
        (
            "ai",
            """ 
            You are a system assistant who helps users find all sessions related to watch from the conference, based off the sessions that are provided to you.
            Sessions will be provided in an assistant message in the format of `title|abstract|speakers|start-time|end-time|room|track|session_type|topics|level|Session URL`. You can use only the provided session list to help you answer the user's question.
            if the user asks about a speaker, you can respond with the sessions that the speaker is participating in.
            If the user asks a question that is not related to the provided sessions, you can respond with a message that I'm unable to assist with that question because the information you're asking for is not available in the database..
            Your answer must have the session title, a very short summary of the abstract, the speakers, the start time, the end time, the room, track, session type topic and level. In the end insert the session URL to open in a new windows.
            """,
        ),
        (
            "human", """
            The sessions available at the conference are the following: 
            {sessions}                
            """
        ),
        (
            "human", 
            "{question}"
        ),
    ]
)

def configure_app():
    """Configura a aparência e o layout do aplicativo Streamlit."""
    st.set_page_config(
        page_title="Chat",
        page_icon="💬",
        layout="wide",
        initial_sidebar_state="expanded",
    )
    st.header('Session Explorer: Your Guide to the Data Pass Summit 2024')

    st.write("""Ask something like 'What are the sessions about Azure SQL and AI?' or 'What are the sessions by Davide Mauri?'""")
        
def sidebar_inputs():
    """Exibe o menu lateral para inserção das informações do administrador e upload do arquivo."""
    with st.sidebar:        
        
        st.image("https://passdatacommunitysummit.com/assets/images/pass-2024-logo-lock-up--dark--with-icon.svg")   
        
        # Opção de seleção entre Open AI e Groq para definir o modelo
        modelo = st.selectbox("Select the model:", ('gpt-4o-mini','gpt-4o' ))
                         
        ""

        "You can find more information about this app in my blog post: [Session Explorer in Action: Personalizing Conference Experiences with AI Using Vector Support in Azure SQL, LangChain, and Streamlit](https://lawrence.eti.br/2024/11/20/session-explorer-in-action-personalizing-conference-experiences-with-ai-using-vector-support-in-azure-sql-langchain-and-streamlit/)"
        ""
        "The PASS Data Community Summit is an annual conference designed for data professionals to connect, share insights, and learn from peers and industry leaders. It focuses on a wide range of topics, including analytics, architecture, database management, development, and professional growth, across multiple platforms such as Microsoft, AWS, Google, PostgreSQL, and others."        
        ""
        "Official website: [PASS Data Community Summit](https://passdatacommunitysummit.com/)"
        ""	
        ""
        ""
        "Created by [Lawrence Teixeira](https://www.linkedin.com/in/lawrenceteixeira/)"

    return modelo        
        
def main():    
    """Função principal do aplicativo, onde todas as funções são chamadas."""
        
    configure_app()
            
    global MODELO

    modelo = sidebar_inputs()
    
    MODELO = modelo

    llm = ChatOpenAI(
        model=MODELO,
        temperature=0,
        max_tokens=16383,
        timeout=None,
        max_retries=2,
        streaming=False,
    )

    if "messages" not in st.session_state:
        st.session_state["messages"] = [{"role": "assistant", "content": "Hi! 😊 How are you? 💬 Feel free to ask anything about the sessions at PASS Data Community Summit 2024!"}]

    for msg in st.session_state.messages:
        if msg["role"] != "system":
            st.chat_message(msg["role"]).write(msg["content"])

    if prompt_entrada := st.chat_input("Type your message here"):
        st.session_state.messages.append({"role": "user", "content": prompt_entrada})
        st.chat_message("user").write(prompt_entrada)
        
        with st.spinner('Searching...'): 
            
            retriever = RunnableLambda(get_similar_sessions).bind() 

            rag_chain = {"sessions": retriever, "question": RunnablePassthrough()} | prompt | llm

            response_chat = rag_chain.invoke(prompt_entrada)            
            
            response = response_chat.content
        
        if response:
            result = (str(response))
        else:
            result = (str(":)"))

        msg = { "role": "assistant",
                "content": result
        }

        st.session_state.messages.append(msg)
                
        st.chat_message("assistant").write(msg["content"])    

if __name__ == "__main__":
    main()