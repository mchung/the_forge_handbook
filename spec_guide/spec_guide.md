Glassbreakers Spec Guide
=======

Fundamentals 
--------
####*At Glassbreakers we value a well tested app and take pride in our test suite.*####

####Coverage####
Glassbreakers is a fast moving company that pushes code up frequently as we build out new features. The development team relies on a well tested app to have the confidence to push code to production without causing errors and/or negatively affecting a user's experience. We keep a close eye on Code Climate, which we use to monitor our testing coverage, and as of Sept 15th the Glassbreakers app has 97% coverage. 

####Balancing Act####
Although it would be nice to have every edge case covered in our specs, our test suite should be there as a tool to help us write code productively and confidently and should not inhibit us from getting features out. It is easy to just throw on a bunch of tests push the test coverage up but don't actually test what matters most. Here at Glassbreakers we put thought into what matters most with our app and make sure out specs match accordingly. We also don't want to waste time writing specs that don't help and get out less features to improve the product. We use tools like Google Analytics to know the features/pages that Glassbreakers use most and place the highest priority there. 

  When deciding what to cover in your specs consider the following:
  - Black box, test what goes in and assert what comes out. Don't test private methods.
  - Is there a 90% probability the edge case will happen?
  - What type of impact will it have on the user?
    - A nice to have, but not a necessity (low risk, cover most common cases)
    - A slight inconvenience (cover majority of cases)
    - A critical feature to proceed (cover as many as feasible)
    - A security risk (cover all cases)

####Consistency####
A consistent test suite is an outcome of a developer team that cares about the product, who is able to work together and that practices good communication.

Bonuses of a consistent testsuite:
- Easier debugging.
- Being able to easily navigate a codebase.
- Allows a developer to focus on the logic and not worry about about how to setup the tests.
- No need to spend time explaining the why we did what we did.

####Best Judgement####
These are best practices for going forward. If you are writing new specs or updating an existing spec, do your best to follow these guides unless you have good reason not to. We don't want to break what is already working so use your best judgement on what to update and what to leave alone for now. We as a team own this spec guide, so if you see something that is more than a one time exception, don't hesitate to open a pull request!  

Now get back to kicking ass and breaking glass and go write some awesome code! 

High Level Spec Setup
--------
###*These conventions are best practices across all spec types*###

####Outside in Testing####
  * pattern for writing tests
  * start writing test at highest level
  * assert on behavior that user can see
  
####Naming####
Print out all the specs titles to include with your code review, all names should be readable and clear of what the code covers and what edge cases are being tested.

Remove duplicate phrasing and weak words like 'should'. 

replace `it "should add the item to the list" do`
with `it "adds the item to the list" do`
  
####File Stucture####
  - It is nice to have files under 100 lines but the file size is lowest on priority over code being well tested
  - All specs go in their spec type folders
   * ie. Model, Feature ect.
  - Feel free to make nested sub-folders for features.
   * Ie. Subfolder for pending users, active users, deactivated users

####Hound Issues####
We use [Hound](https://github.com/thoughtbot/hound) to help keep our code clean and consistent. We are more flexible with hound issues on Spec tests with the highest priority being clear of what is being tested. If a spec name is longer than 80 characters, see if there is a quick way to shorten the name without losing the meaning, if not don't let this hold you back and move on.  


Spec Specifications 
--------
####*We now know what to test, where to test it, and why it's important but let's dig into the details and see how!*####

####Arrange-Act-Assert pattern####
  * Arrange: setup all nessary preconditions and inputs
  * Act: on the object or method being tested
  * Assert: the expected results have occurred.

####Describes, Features and Contexts... on my!####
The purpose of “describe” is to wrap a set of tests against one functionality while “context” is to wrap a set of tests against one functionality under the same state. 
 * Use Describe for things (top level and methods).
 * Use context for states.
 * User Features for tope level of Feature tests


####Before, Let, and Instance variables####
 - Avoid instance variables: [why](http://stackoverflow.com/questions/5359558/when-to-use-rspec-let/5359979#5359979)
 - before eagerly runs code before each test.
 - let lazily runs code when it is first used which is better then automatically running unneeded logic.  
 - Make sure the lets aren't to distant so it is still readable easy to track what is going on.

####Factory Girl and Fixtures####
* [Factory Girl Gem] (https://github.com/thoughtbot/factory_girl)
* [why factories are better than fixtures] (http://www.hiringthing.com/2012/08/17/rails-testing-factory-girl.html#sthash.h7s1sDju.dpuf)

At any time possible, use Factory girl and not fixtures. Factory Girl is reliable and requires little maintance. With Factory Girl, a model updates with your development as you merge in updates to your models.

A case for fixtures would be if you need to pass in a CSV file, or create an object to pass in that is not a Model.  

####JavaScript####
By default Capybara emulates a headless browser which is fast but does not run JavaScript. If you need to enable JavaScript in a test, include in `js:  true`. 
-'js: true' can be added to a describe block, context or single spec
- It does take more time to run a JS enabled spec, only apply it to the smallest block possible. 
- Ex: `it "tests using javascript" js:  true, do`
[Capybara and JS](http://tutorials.jumpstartlab.com/topics/capybara/capybara_with_selenium_and_webkit.html)

####Reusing Code####
Some test cases can take a lot of setup and be repetitive. These are great cases to reuse code in a test suite. Just remember the balance of saving lines of code and being able to quickly understand what is being test. 
[reusing code] (http://testdrivenwebsites.com/2011/08/17/different-ways-of-code-reuse-in-rspec/)

#####Shared examples#####

[shared examples](https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples)
Shared examples allow us to execute the same group of expectations against several classes. Only use if there are more then 2 casese that could call them. If all of the calls to the shared example are in one file, place the shared example up top of that file, otherwise place in spec/support/examples. 
  
#####Helper Methods#####

The primary use of helper methods is to hide implementation details by grouping several low-level statements into more meaningful, higher level abstractions (with clear, expressive names). If you have an urge to write a comment explaing what you are doing, this would be a great case to make a helper method with a clear name. 

If the helper method is only being accessed in one file, place at the bottom of the file. If they are shared, place in the appropriate spec type subfolder under support. Ex: spec/support/features/feature_name_helpers.rb

Spec types
-------
####*Follow these as general guidelines in choosing what Specs to great. Always start high level (ie feature spec) and work from there.*####

###Feature Specs###
[Example feature spec format](https://github.com/Glassbreakers/the_forge_handbook)

Feature Specs are what drive the Glassbreakers testsuite. They are high level tests that walk through entire application. Think of it as an actual user testing out the web interface. Only focus on what the user will see, do not test any logic in the feature tests that should be behind the scenes to the user.

###Controller Specs###
[Example controller spec format](https://github.com/Glassbreakers/the_forge_handbook)

Most controller specs should be hit through the feature specs. Use your best judgement if additional controller specs are needed.  

###Mailer Specs##
[Example mailer spec format](https://github.com/Glassbreakers/the_forge_handbook)

Include a complete Mailer Spec for all mailers to ensure emails are being formatted correctly and have the correct user data. 

###Model/Unit/Services###
-----
[Example model spec format](https://github.com/Glassbreakers/the_forge_handbook)

[Great talk by Sandi Metz] (https://www.youtube.com/watch?v=URSWYvyc42M)

The job for a model, unit or services spec is to test that each individual component is doing it's job correctly and narrow the focus down until the entire universe is a single object. That object is all the test knows about. 
These tests should be thorough, stable, fast, and few. Test the interface, not the implementation to allow for refactoring. Do not test private methods as it will inhibit refactoring. If you have a complicated private algorithm, this may require testing to get it running but should be segregated and noted that the test can be deleted with refactoring. 
