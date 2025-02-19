# AutoGPT: An Autonomous GPT-4 Experiment

- Forked from: https://github.com/ChatGPTUp/Auto-GPT
- I removed the original README.md and added my own README.md for the simplicity.
- Recommend to see [the original repository of AutoGPT](https://github.com/Significant-Gravitas/Auto-GPT) for the installation and usage.

## Quick Start

You have to set variables in `.env` file.

```shell
OPENAI_API_KEY=${YOUR_OPENAI_API_KEY}
SLACK_SIGNING_SECRET=${YOUR_SLACK_SIGNING_SECRET}
SLACK_BOT_TOKEN=${YOUR_SLACK_BOT_TOKEN}
```

### Run in Terminal

Please use python 3.10 or higher.

```shell
./run.sh --help   # lists all the possible command line arguments
./run.sh 
```

### Run FastAPI Server

If you use host port 8000 and container port 30207, you can use the following command. For deploying the slack bot, I used [DigitalOcean](https://cloud.digitalocean.com) droplet.

```shell
pip install --ignore-installed PyYAML -r requirements.txt   # I got a problem with PyYAML
apt-get install -y libglib2.0 libnss3 libgconf-2-4 libfontconfig1 chromium-driver
cd slack
uvicorn app:app --host 0.0.0.0 --port 8000 --reload
```

(WARNING) There is error in following commands. I will fix it later.

```shell
# with docker
docker build -t auto-gpt .
docker run -it -p 8000:30207 --env-file=.env -v $PWD:/app --rm auto-gpt
```

## Slack Integration

1. Create Slack Bot: https://api.slack.com
2. Add keys in `.env` file
   - `SLACK_SIGNING_SECRET`: slack API app page / Basic Information / App Credentials / Signing Secret
   - `SLACK_BOT_TOKEN`: slack API app page / Features / OAuto & Permissions / Bot User OAuth Token

3. Change `<@U05C61LM9FW>` in `slack/app.py` to your slack bot id.
4. Set Bot Token Scopes: `files:write` 
5. Set Event Subscriptions: `app_mention`
6. Add slack bot to your channel and Mention your slack bot with a command

## Commands
- `@bot_name !{context}`: Using GPT-4 (GPT-4 API access permission required)
- `@bot_name %{context}`: Using GPT-3.5 
- `@bot_name ?{context}`: Debugging mode
- `@bot_name stop`: Stop AutoGPT in current thread. Type this command in the target thread as comment.
