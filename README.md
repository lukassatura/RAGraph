# RAGraph
Sample RAG chatbot querying a graph database with agentic workflow in LangChain

This project is a free implementation of the Real Python's tutorial:
[Build an LLM RAG Chatbot With LangChain](https://realpython.com/build-llm-rag-chatbot-with-langchain/) by Harrison Hoffman.

# Prerequisites (diff from the tutorial)
Here, I use Poetry as my environment manager with `pyenv` to manage the local versions of Python. First install `pyenv` via brew as [described here](https://github.com/pyenv/pyenv), then install `poetry` as:
```bash
pipx install poetry
```
and make sure to keep `export PATH="$HOME/.local/bin:$PATH"` in your `.zshrc` file, if using zsh like me.

`pyenv` makes use of either setting the local Python version via 
```bash
pyenv local <your-python-version>
```

or specified in the `.python-version` file, such as in here.

We also use the `Makefile` for convenient shortcuts in dev, testing and for CI/CD processes. But first, initialize the environment via the Poetry wizard:
```bash
poetry init
```
Go through the individual steps of the wizard, but do not specify the dependencies yet (answer 'no' to the question to specify them interactively).
Note the file `poetry.toml` created in your workspace. Then, run
```bash
make setup
```
This will configure `poetry` to use the virtualenv python environment.

Next, we install our dependencies. We are using:
- langchain
- openai
- langchain-openai
- langchain-community
- langchainhub
- python-dotenv

> [!TIP]
> Note that Poetry resolves the version compatibility among the dependencies (Thank you, Poetry!).

Simply, just run:
```bash
poetry add langchain openai langchain-openai langchain-community langchainhub python-dotenv
```
This concludes the prerequisites for setting up this project.