# devopspase# kbot — Telegram Bot in Golang

## Overview
This is a simple Telegram bot written in Go, using the [cobra](https://github.com/spf13/cobra) CLI library and the [telebot.v3](https://github.com/tucnak/telebot) framework.  
The bot listens to text messages and responds based on predefined commands.

## Bot Link
[t.me/yourbotname_bot](https://t.me/yourbotname_bot)

## Features
- Responds to `/hello` with a friendly greeting
- Provides help instructions with `/help`
- Handles unknown commands gracefully

## Installation and Setup

1. Clone the repository:
    ```bash
    git clone https://github.com/YourUsername/kbot.git
    cd kbot
    ```

2. Download dependencies:
    ```bash
    go mod tidy
    ```

3. Set your Telegram bot token as an environment variable:
    ```bash
    export TELE_TOKEN="your_telegram_bot_token"
    ```

4. Run the bot:
    ```bash
    go run main.go start
    ```

## Usage

Send a message to your bot on Telegram:

- `hello` — The bot replies with a greeting.
- `help` — The bot sends a list of available commands.
- Any other text — The bot responds that it doesn’t understand.

## Contribution

Feel free to fork the repository and submit pull requests to improve the bot.

## License

This project is licensed under the MIT License.

