helper
=======
Ever wanted to develop a website using [Haml](haml.info), [Sass](sass-lang.com) or [CoffeeScript](coffeescript.org) but don't like the idea of having to compile the your code after every change, or you're just too lazy to set up an autocompiler?

If your answer is *yes*, then **helper** is here to give you a hand!

The process is still a little bit manual, but faster than setting up an autocompiler, for sure.

Requirements
------------
In order to run **helper** you need Ruby 2.1 or newer, and the most recent version of RubyGems.

Installation
------------
To install the software, you can either download this folder and unzip it, or clone directly from GitHub.

How to Use
-----------
**helper** will automatically create the necessary files for you to run `bundle install`, and install the necessary gems, and then `guard` to listen to file changes and compile.

Inside **helper** folder, run the following command `ruby command.rb --help`.

You will be presented with the options for your project. Choose the technologies you want to work with and the input and output folders.

###Example###

If you want to work with Haml, Sass and CoffeeScript, and want everything to be autocompiled, you could run the following command: `ruby command.rb --haml -i haml -o public --sass -i sass -o public/css --coffee -i coffee -o public/js --guard`.

The flags `--haml`, `--sass` and `--coffee` indicate that you want to work with these technologies. What you enter after `-i` is the input folder, where your code will be. After `-o` is the compiled, output folder (html, css, javascript). Lastly `--guard` tells the **helper** that you want your code to be automatically compiled.

After running this command, run `bundle install`. All the necessary gems will be installed. After that, move the folder structures, as well as the files *Gemfile*, *Gemfile.lock* (if existing) and *Guardfile* to any location that you want (maybe your main project folder). After doing so, go to your project folder and run `guard`.

That's it! You're ready to start writing amazing code!

About the project
-----------------
To have **helper** working, you still need some manual cutting and pasting, but I'm working on an improved version, to have it released as a gem, so this process will be even faster, and you'll be able to use **helper** anywhere you like it.
