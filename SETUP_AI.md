# AI Features Setup Guide

This guide helps you set up AI features in your Neovim configuration.

## 🤖 Available AI Features

- **ChatGPT Integration**: AI-powered code assistance
- **Code Editing**: AI-assisted code editing and optimization
- **Code Explanation**: Get explanations for complex code
- **Code Fixing**: AI-powered bug fixing and improvements

## 🔑 Setting Up OpenAI API Key

### Option 1: Environment Variable (Recommended)

1. **Get your OpenAI API key**:
   - Go to [OpenAI Platform](https://platform.openai.com/)
   - Sign in or create an account
   - Navigate to API Keys section
   - Create a new API key

2. **Set the environment variable**:
   
   **For macOS/Linux (zsh/bash)**:
   ```bash
   # Add to ~/.zshrc or ~/.bashrc
   export OPENAI_API_KEY="your-api-key-here"
   
   # Reload your shell
   source ~/.zshrc
   ```

   **For macOS/Linux (fish shell)**:
   ```fish
   # Add to ~/.config/fish/config.fish
   set -gx OPENAI_API_KEY "your-api-key-here"
   ```

   **For Windows (PowerShell)**:
   ```powershell
   # Set environment variable
   $env:OPENAI_API_KEY="your-api-key-here"
   
   # Or set permanently
   [Environment]::SetEnvironmentVariable("OPENAI_API_KEY", "your-api-key-here", "User")
   ```

### Option 2: Using a .env file

1. **Create a .env file** in your home directory:
   ```bash
   echo "OPENAI_API_KEY=your-api-key-here" > ~/.env
   ```

2. **Load the .env file** in your shell configuration:
   ```bash
   # Add to ~/.zshrc or ~/.bashrc
   if [ -f ~/.env ]; then
     export $(cat ~/.env | xargs)
   fi
   ```

## 🚀 Using AI Features

Once the API key is set, you can use these key mappings:

### Chat with AI
- `<Space>ai` - Open ChatGPT chat interface

### Code Editing
- `<Space>ae` - Edit selected code with AI instruction
- `<Space>ag` - Run predefined AI actions on selected code

### Available AI Actions
- **Fix spelling** - Fix spelling mistakes
- **Explain code** - Get code explanations
- **Optimize code** - Optimize and improve code
- **Add comments** - Add helpful comments
- **Fix code** - Fix bugs and issues

## 🔧 Troubleshooting

### API Key Not Working
1. **Check if the key is set**:
   ```bash
   echo $OPENAI_API_KEY
   ```

2. **Restart Neovim** after setting the environment variable

3. **Check the key format**: Should start with `sk-`

### ChatGPT Plugin Not Loading
1. **Check plugin status**:
   ```vim
   :Lazy health chatgpt.nvim
   ```

2. **Check for errors**:
   ```vim
   :messages
   ```

3. **Reinstall the plugin**:
   ```vim
   :Lazy clean
   :Lazy sync
   ```

### API Rate Limits
- OpenAI has rate limits based on your plan
- Free tier: Limited requests per minute
- Paid tier: Higher limits
- Check your usage at [OpenAI Usage](https://platform.openai.com/usage)

## 💡 Tips

1. **Use specific instructions**: Be clear about what you want the AI to do
2. **Select relevant code**: Highlight the code you want to modify
3. **Review changes**: Always review AI-generated code before accepting
4. **Use context**: Provide context about your project when asking questions

## 🔒 Security

- **Never commit your API key** to version control
- **Use environment variables** instead of hardcoding
- **Rotate your API key** regularly
- **Monitor usage** to detect unauthorized access

## 📚 More Information

- [OpenAI API Documentation](https://platform.openai.com/docs)
- [ChatGPT.nvim Plugin](https://github.com/jackMort/ChatGPT.nvim)
- [OpenAI Pricing](https://openai.com/pricing)

---

**Note**: AI features require an active internet connection and a valid OpenAI API key. Usage may incur costs based on your OpenAI plan.
