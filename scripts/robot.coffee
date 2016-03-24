module.exports = (robot) ->

  # Have robot respond when specific words are used

  robot.hear /worst/i, (res) ->
      res.reply "Worst? More like the best."

  robot.hear /terrible/i, (res) ->
      res.reply "If by terrible, you mean awesome, then you're right!"

  robot.hear /\bno\b/i, (res) ->
      res.reply "I think you mean yes."

  robot.hear /\bbad\b/i, (res) ->
      res.reply "Nah, it's never bad. It's all good."

  robot.hear /broke/i, (res) ->
      res.reply "It's not broken. It's exactly the way it's supposed to be :)"

  robot.hear /mistake/i, (res) ->
      res.reply "Nah, I meant to break all the things."

  robot.hear /\bhate\b/i, (res) ->
      res.reply "I think you meant love <3"

  robot.hear /\bnever\b/i, (res) ->
      res.reply "Never say never :)"

  robot.hear /wrong/i, (res) ->
      res.reply "Or did you mean...right?"

  robot.hear /whatever/i, (res) ->
      res.reply "No need for so much 'tude :)"

  robot.hear /boring|atrocious|awful|clumsy|cheap|banal|crazy|insane|fail|dreadful|faulty|buggy|gross|grim|hideous|horrid|horrible|monstrous|nonsense|offensive|old|dated|stupid|shoddy|sad|questionable|poor|ugly|unpleasant|unwanted|unwise|vile|lame|sucks/i, (res) ->
      res.reply "I think you mean awesome. Always, awesome."

  # Have the robot tell you something randomly from a list

  jokes = ["What do you call a programmer from Finland? Nerdic.", "What is a programmer's favorite place to hangout? Foo Bar.", "Why did the programmer quit his job? Because he didn't get arrays.", "What do computers and air conditioners have in common? They both become useless when you open windows.", "Why did the programmer have to wear glasses? Because she couldn't C#.", "A SQL query goes into a bar, walks up to two tables and asks, 'May I join you?'"]

  robot.respond /tell me a joke/i, (res) ->
    res.reply res.random jokes

  inspirationalQuotes = ['"Either you run the day or the day runs you." -Jim Rohn', '"Accept the challenges so that you can feel the exhilaration of victory." -George S. Patton', '"When you reach the end of your rope, tie a knot in it and hang on." -Franklin D. Roosevelt', '"In order to succeed, we must first believe that we can." -Nikos Kazantzakis', '"Life is 10% what happens to you and 90% how you react to it." -Charles R. Swindoll', '"What you do today can improve all your tomorrows." -Ralph Marston', '"The secret of getting ahead is getting started." -Mark Twain', '"Don\'t watch the clock; do what it does. Keep going." -Sam Levenson', '"Keep your eyes on the stars, and your feet on the ground." -Theodore Roosevelt', '"Problems are not stop signs, they are guidelines." -Robert H. Schuller', '"We may encounter many defeats but we must not be defeated." -Maya Angelou']

  robot.respond /give me inspiration/i, (res) ->
    res.reply res.random inspirationalQuotes

  songs = ["Don't Stop Believing by Journey", "All You Need is Love by the Beatles", "With a Little Help from my Friends by the Beatles", "Buddy Holly by Weezer", "I Gotta Move by Ben Kweller", "Everlasting Light by the Black Keys", "Anti-Summersong by the Decemberists", "Mr. Blue Sky by Electric Light Orchestra", "Two Weeks by Grizzly Bear", "Lisztomania by Phoenix", "Water by Ra Ra Riot", "The Underdog by Spoon", "Mushaboom by Feist"]

  robot.respond /sing me a song/i, (res) ->
    res.reply res.random songs

  smiles = ["https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr02/2013/5/30/18/anigif_enhanced-buzz-3389-1369954359-12.gif", "https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr05/2013/5/30/16/anigif_enhanced-buzz-29323-1369944638-21.gif?no-auto", "https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr05/2013/5/30/18/anigif_enhanced-buzz-12657-1369952487-33.gif?no-auto", "https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr05/2013/5/30/14/anigif_enhanced-buzz-29323-1369940299-3.gif?no-auto", "https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr06/2013/5/30/14/anigif_enhanced-buzz-32228-1369939787-22.gif?no-auto", "https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr05/2013/5/30/17/anigif_enhanced-buzz-12716-1369949373-1.gif?no-auto", "https://img.buzzfeed.com/buzzfeed-static/static/enhanced/webdr03/2013/5/30/18/anigif_enhanced-buzz-32505-1369952618-7.gif?no-auto"]

  robot.respond /make me smile/i, (res) ->
    res.reply res.random smiles

# Have the bot add a new item to an array - need to remove items too

  robot.respond /add a (.*)/i, (res) ->
    addItem = res.match[1]
    if addItem is "joke"
      res.reply "What's your joke?"
      robot.respond /joke - (.*)/i, (jokeRes) ->
        newJoke = jokeRes.match[1]
        jokes.push newJoke
    else if addItem is "quote"
      res.reply "What's your quote?"
      robot.respond /quote - (.*)/i, (quoteRes) ->
        newQuote = quoteRes.match[1]
        inspirationalQuotes.push newQuote
    else if addItem is "song"
      res.reply "What's your song?"
      robot.respond /song - (.*)/i, (songRes) ->
        newSong = songRes.match[1]
        songs.push newSong
    else if addItem is "smile"
      res.reply "What's your gif url?"
      robot.respond /url - (.*)/i, (smileRes) ->
        newSmile = smileRes.match[1]
        smiles.push newSmile
    else
      res.reply "Sorry, that won't work."
