# Chat with PASS Data Community Summit 2024 Sessions

## Session Explorer: Your Guide to the Data Pass Summit

This app is designed to help users explore sessions at the PASS Data Community Summit 2024. It leverages the power of OpenAI's GPT models to answer user queries about the conference sessions, providing an interactive and user-friendly interface.

---

### Features
- **Search Sessions**: Users can ask questions about the sessions, such as finding sessions by a specific speaker, or explore sessions by topic.
- **AI-Powered Responses**: Uses OpenAI's models to generate detailed yet concise responses about the conference sessions.
- **Customizable Models**: Choose between `gpt-4o-mini` and `gpt-4o` models for response generation.
- **Session Summary**: Each answer includes session details such as title, summary, speakers, schedule, room, track, and a URL for more information.
- **Admin Inputs**: Easy configuration for administrators through a sidebar interface.

---

### About the PASS Data Community Summit
The PASS Data Community Summit is an annual conference for data professionals. It focuses on topics like analytics, architecture, database management, and professional growth across platforms like Microsoft, AWS, Google, PostgreSQL, and others.

- **Official Sessions**: [Sessions](https://passdatacommunitysummit.com/sessions/)
- **Website**: [PASS Data Community Summit](https://passdatacommunitysummit.com/)

---

### How to Use
1. **Run the App**:
   - Ensure you have Streamlit installed.
   - Load your `.env` file with your OpenAI API key or provide it during runtime.
   - Run the app using the command:
     ```bash
     streamlit run chat.py
     ```

2. **Explore Sessions**:
   - Use the sidebar to upload admin configurations or select the AI model.
   - Type questions about the sessions into the chat interface.

3. **Admin Configuration**:
   - Administrators can upload data or choose models via the sidebar.

---

### Prerequisites
- Python 3.11+
- Installed libraries listed in `requirements.txt`
- OpenAI API Key (required for querying the language model)

---

### Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/LawrenceTeixeira/SessionsChat.git
   cd app/chat
   ```

2. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Set Up API Keys**:
   - Create a `.env` file in the root directory.
   - Add your OpenAI API key:
     ```
     OPENAI_API_KEY=<your_api_key>
     ```

4. **Run the App**:
   ```bash
   streamlit run chat.py
   ```
## Deploy at Fly.io
```sh
flyctl launch
flyctl deploy
```

## Login and logout at Fly.io
```sh
flyctl auth login
flyctl auth logout
```

## Install fly
```sh
curl -L https://fly.io/install.sh | sh
export PATH=/home/codespace/.fly/bin
```

---

### Folder Structure
```
/app
├── chat
│   ├── Dockerfile
│   └── chat.py
├── requirements.txt
```

- `chat.py`: Main application script for Streamlit.
- `utilities.py`: functions to call the Azure SQL database with the Vector Support feature.
- `requirements.txt`: Contains all dependencies required for the app.

---

### Built With
- **Streamlit**: For creating the interactive UI.
- **LangChain**: For handling AI-driven workflows and prompts.
- **OpenAI GPT Models**: For generating AI-powered responses.
- **Azure SQL**: Demonstrates integration with Native Vector Support for advanced search.

---

### Author
- **Lawrence Teixeira**  
  [LinkedIn Profile](https://www.linkedin.com/in/lawrenceteixeira/)  
  Senior Leader in Data Analytics and Generative AI Solutions.

### License
This project is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.

## Contato
Para mais informações, entre em contato pelo link: [Contato](https://lawrence.eti.br/contact/)