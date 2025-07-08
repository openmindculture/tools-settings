# tools-settings
Tools, Settings, Code Snippets for personal use,
depends on the operating system, only install to fix actual issues!
Mainly used an tested on Linux (Ubuntu / mate / mint / budgie).
Visual Studio Code settings are compatible to VS Codium settings.

> If it ain't broke, don't fix it.

## Knowledge Base + Code Library

TODO: alway ensure that code snippets and screenshot don't expose customer data

TODO: add screenshots

TODO: Building a Custom Knowledge Base (Intermediate to Advanced)

This is where you explicitly feed your project's code and documentation to the AI as a dedicated knowledge source. This typically involves techniques like Retrieval-Augmented Generation (RAG) or, in more advanced cases, fine-tuning.

A. Retrieval-Augmented Generation (RAG) - Most Practical for Individual Use

RAG is the most common and accessible way to augment an LLM with your private data. Instead of retraining the entire model, you create a searchable knowledge base from your git projects. When you prompt the AI, relevant snippets from your knowledge base are retrieved and provided to the LLM as additional context.

1. Extract Your Code and Documentation: create a script to traverse your code repositories, selective Inclusion based on file suffixes vs. exclusion-based scraping. Format for LLM Consumption: Combine the content of chosen files into a structured format. A good approach is to prefix each code/document chunk with its filename and path for context (e.g., // FILE: src/my_module/utils.py\ndef my_function()

Example script idea for bash or python, to do extract from these notes

```
#!/bin/bash
output_file="./combined_for_llm.txt"
> "$output_file" # Clear existing file

git ls-files --cached --others --exclude-standard | while read -r file; do
  if [ -f "$file" ]; then
    echo "// FILE: $file" >> "$output_file"
    cat "$file" >> "$output_file"
    echo "\n" >> "$output_file" # Add a newline for separation
  fi
done
```

Chunking and Embedding:

Chunking: Break down your extracted code and documentation into smaller, manageable "chunks." These chunks should be semantically meaningful (e.g., a single function, a class definition, a paragraph of documentation). Tools exist to help with code-aware chunking.

Embedding: Use an embedding model (e.g., from OpenAI, Google, Hugging Face) to convert each text chunk into a numerical vector (embedding). These embeddings capture the semantic meaning of the chunk.

Vector Database:

Store these embeddings in a vector database (e.g., Chroma, Pinecone, FAISS, Weaviate). This allows for efficient similarity search.

Integration with your AI Assistant/Workflow:

Prompt-based RAG (DIY):

When you have a coding query, first perform a semantic search in your vector database using the query.

Retrieve the top N most relevant code/documentation chunks.

Construct a prompt for your LLM (Copilot, Google AI Studio, JetBrains AI) that includes your original query and the retrieved relevant chunks as context.

This works best if the AI platform allows for sufficiently large context windows.

Tools/Platforms with RAG Capabilities:

Google AI Studio (Gemini API): You can programmatically integrate your RAG system with the Gemini API. You'd manage your knowledge base externally (as described above) and then include the relevant context in your API calls. Google Cloud Vertex AI offers more robust RAG solutions for enterprises, which might be overkill for an individual, but worth knowing.

GitHub Copilot Enterprise, Third-Party RAG Frameworks: Frameworks like LangChain or LlamaIndex, Local LLMs (with RAG) like Code Llama, StarCoder via Ollama) and implement a RAG system on top of them. This gives you full control over your data.#

JetBrains AI Assistant:

Contextual Understanding: JetBrains AI Assistant excels at understanding the context within your IDE (open files, project structure).

Prompt Library: JetBrains IDEs offer a "Prompt Library" where you can save custom prompts. While not a full knowledge base, you can create prompts that encourage the AI to consider specific patterns or best practices from your projects.

Limited Direct Knowledge Base Integration: Similar to individual Copilot, direct "uploading" of an external knowledge base for RAG isn't a core user-facing feature. However, you can use local RAG (as described above) to pre-process your queries before sending them to the JetBrains AI assistant's chat.

See full discussion in this public prompt archive (TODO verify if that lasts) created by sharing a gemini conversation as a public link:

https://g.co/gemini/share/8c6ea26002e9

- TODO link more public discussions, blog posts, tutorials,
- TODO link more files from this very repository
- TODO link my own recent, featured, or "best practice" repositories, public or not, e.g.
     -  https://github.com/openmindculture/intellij-orange-rain-light-theme
     -  https://github.com/openmindculture/gist-patches
     -  https://github.com/openmindculture/tools-settings
     -  https://github.com/openmindculture/kleiderordnung-berlin
     -  https://github.com/openmindculture/sw-IngoSCostTransparency
     -  https://github.com/openmindculture/ingo-steinke.de
     -  https://github.com/openmindculture/react-dataviz-demo
- https://dev.to/ingosteinke/8-alternatives-to-ai-for-coding-and-creativity-26k3
- https://dev.to/ingosteinke/where-is-the-vibe-in-vibe-coding-and-what-happened-to-music-monday-49ek
- https://dev.to/ingosteinke/pure-css-parallax-perspective-beyond-landscape-images-24g2
- https://dev.to/ingosteinke/css-hasparent-selectors-287c
- [Personalizing AI Coding Assistants with Git and RAG](https://g.co/gemini/share/8c6ea26002e9)
- [Disable YouTube Auto-Translation Audio](https://g.co/gemini/share/35a4831e5ab2)

How limited is Google Gemini chat history? Can I access chat that are not longer in the chat history? Can I always access Gemini chats shared using a public link or do they expire? 

Limitations of Google Gemini Chat History:

Context Window vs. Long-Term Memory: While Gemini, especially versions like 2.5 Pro, have a large "context window" (the amount of information it can actively remember within a single conversation), this isn't infinite. As chats get very long, Gemini may start prioritizing recent information, potentially "forgetting" earlier parts of the same conversation.

No Dedicated Search Function (as of early July 2025): Currently, there isn't a robust, built-in keyword search function for your entire Gemini chat history. You can usually see a list of your recent and pinned chats, but finding a specific older conversation often involves a lot of manual scrolling. There are indications that Google is working on adding a search feature.

Reliance on Google Activity: Your chat history with Gemini is saved and managed through your Google account's "My Activity" section, specifically under "Gemini Apps Activity." This is where you can review, delete, or manage how long this information is stored.

Users can generally access chats that are no longer immediately visible in your recent or pinned chats. As mentioned, your full chat history is stored in your "Gemini Apps Activity" within your Google account. You'll need to go to myactivity.google.com/product/gemini and scroll through the chronological list to find older conversations. However, as noted above, there's no easy search functionality there yet.

When you share a Gemini chat using a public link (e.g., g.co/gemini/share/abcxyz), that link remains publicly accessible as long as the associated chat is saved in your Gemini Apps Activity. Creating a public link means anyone with the link can read the chat and even continue it with Gemini Apps on their own (unless it's a chat created with Gems or a premium plan that the new user doesn't have a subscription for). Your name or account is not added to the URL.A public link will be deleted if any part of the original chat it links to is deleted from your Gemini Apps Activity. This can happen if:

You manually delete it from your Gemini Apps Activity.

It's automatically deleted from your Gemini Apps Activity based on your retention settings.

You delete it from your pinned and recent chats.

## settings
bashrc.d         includes for bashrc / profile
bashrc.d/prompt  minimalistic git prompt
bashrc.d/alias   useful aliases

## tools
install.sh	install tools, autodetect yum/apt/port/brew
tomp3.sh        extract audio from mp4/webm files using ffmpeg
touchinit.sh	re-initialize touchpad (workaround; use as launcher)
vpnlauncher.sh	start open VPN session (use as launcher)

