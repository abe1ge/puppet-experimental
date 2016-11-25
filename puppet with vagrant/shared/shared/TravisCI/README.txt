How to use Travis CI:

Travis CI works from a web browser, and acts as a build tool for Git repositories. 

1) Clone your git repository into a location that suits you

2) Go to https://travis-ci.org/ and sign in using your Git account details

3) In the top right, go to your profile, and select which repositories Travis will build.

4) Click the cog symbol to choose when Travis will build your project (Set to push by default)

4) Create a file called ".travis.yml" in the root of your repository 
   (There is a java template supplied, this can be edited to work with a
   variety of tools).

6) Push the file to git and check on your browser to see build results.



In the travis.yml file, there are a series of other commands that can be included:

install: Install any dependencies before running your scrips

before_script: Insert any commands you wish to take place before running your script,
               such as a change of directory

after_success: Tell travis what to do if your build is successful

after_failure: Tell travis what to do if your build fails

after_script: What to do once the script is complete, regardless of result.


