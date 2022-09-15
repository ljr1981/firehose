# Firehose

First steps into building Elixir backend code by way of creating callable JSON Web APIs.

I started with a YouTube video from which I built:

/api/roll           -- Rolls 1 die with result of 1..6
/api/roll/[#]       -- Rolls # number of dice (2 = pair)

The next idea that came to mind was to pull data from an existing Web API randomly on the internet and then pass the results through this Elixir/Phoenix application via Web API call on the Phx Server.

/api/datetime       -- Returns the current UTC datetime.

Finally, I located a number of freely accessible Web APIs and coded a few of them as passthroughs.

/api/freelist       -- A list of some free Web APIs one can access and use.
/api/catfacts       -- Random cat facts.
/api/coindesk       -- Some current currency values.
/api/agify/[name]   -- Send a name and the API will give you an age guess.
/api/joke           -- A random joke.
/api/rnduser        -- Randomly generated user data.

Again, the API calls above are passthroughs to disparate unrelated sources, turn this app into a portal (of sorts).
