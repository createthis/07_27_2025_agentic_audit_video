# What?
This repo contains bash scripts an agentic LLM can use to audit a code repository. I use it with Open Hands AI, 
but you can use it with any sufficiently capable Agentic system.

# Why?
LLMs have limited context length. Also, sometimes their inference engines crash (looking at you ktransformers).

When the amount of data that needs to be audited exceeds the amount of context available, it can be helpful
to track progress via an external database.

# How?
In this case, we are using a super simple flat file system:

- .auditissues.csv - results of audit
- .auditfilesdone - files that have been successfully audited
- .auditfilestodo - files that have not yet been successfully audited
- .auditignore - regex patterns for files that should not be audited
- .auditfiles - complete list of files to audit

There is an example prompt available in prompt.md that explains to the LLM how to use the scripts and what to do.
It is prompting the LLM to audit for network exfiltration in the llama.cpp project. If you have a different purpose
in mind, copy this file and edit it.

Copy the bash scripts into the project you intend to audit.
