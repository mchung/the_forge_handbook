Glassbreakers Spec Guide
=======

Fundamentals 
--------
At Glassbreakers we value a well tested app and take pride in our test suite.

####Coverage####
Glassbreakers is a fast moving company that pushes code up frequently as we build out new features. The development team relies on a well tested app to have the confidence to push code to production without causing errors and/or negatively affecting a user's experience.

####Balance####
Although it would be nice to have every edge case covered in our specs, our test suite should be there as a tool to help us write code productively and confidently and should not inhibit us from getting features out.

  When deciding what to cover in your specs consider the following:
  - Black box, test what goes in and assert what comes out. Don't test private methods.
  - Is there a 90% probability the edge case will happen?
  - What type of impact will it have on the user?
    - A nice to have, but not a necessity (low risk, cover most common cases)
    - A slight inconvenience (cover majority of cases)
    - A critical feature to proceed (cover as many as feasible)
    - A security risk (cover all cases)

####Consistentancy####
A consistent test suite is an outcome of a developer team that cares about the product, is able to work together and practices good communication.
Bonuses of a consistent testsuite
- Being able to easily navigate a codebase
- Allows a developer to focus on the logic and not worry about about how to setup the tests
- No need to spend time explaining why we did what we did.

####Best Judgement####
These are best practices for going forward. If you are writing new specs or updating an existing spec, do your best to follow these guides unless you have good reason not to. We don't want to break what is already working so use your best judgement on what to update and what to leave alone for now. We as a team own this spec guide, so if you see something that is more than a one time exception, please open a pull request with the needed changes.  

High Level Spec Setup
--------
####Outside in Testing####
  * pattern for writing tests
  * start writing test at highest level
  * assert on behavior that user can see
  
####Arrange-Act-Assert pattern####
  * Arrange: setup all nessary preconditions and inputs
  * Act: on the object or method being tested
  * Assert: the expected results have occurred.

####Naming####
Print out all the specs, is it readable and clear of what the main parts of the feature are doing and what is being tested.
  
####File Stucture####
  - It is nice to have files under 100 lines but the file size is lowest on priority over code being well tested
  - All specs go in their spec type folders
   * ie. Model, Feature ect.
  - Feel free to make nested sub-folders for features.
   * Ie. Subfolder for pending users, active users, deactivated users

####Hound Issues####
We are more flexible with hound issues on Spec tests with the highest priority being clear of what is being tested. If a spec name is longer than 80 characters, see if there is a quick way to shorten the name without losing the meaning, if not don't let this hold you back and move on.  

####Factory Girl####
https://github.com/thoughtbot/factory_girl

####JavaScript####
By default Capybara emulates a headless browser which is fast but does not run JavaScript. If you need to enable JavaScript in a test, include in `js:  true`. 
-'js: true' can be added to a describe block, context or single spec
- It does take more time to run a JS enabled spec, only apply it to the smallest block possible. 
- Ex: `it "tests using javascript" js:  true, do`
http://tutorials.jumpstartlab.com/topics/capybara/capybara_with_selenium_and_webkit.html

####Shared examples####
  http://testdrivenwebsites.com/2011/08/17/different-ways-of-code-reuse-in-rspec/
  https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
  http://modocache.io/shared-examples-in-rspec
    What are they:
     they allow us to execute the same group of expectations against several classes
     it_behaves_like ''
    similiar to a helper method but includes assertions
    When to use:
     2 or less no, 3 yes.
    Where to put them:
      If all are called in one file - up top
      spec/support/examples
  
####Helper Methods####
    Inside one file or context - up top using
      let, let!, and before
      https://www.relishapp.com/rspec/rspec-core/v/3-3/docs/helper-methods/let-and-let
    Module - support/features/feature_type_helpers.rb



####Stubs####


Feature Specs
---------

Controller Specs
----------

Model/Unit tests
-----
Narrow the focus down until the entire universe is a single object, that object is all the unit test knows about
-every cell works correctly
-thorough
-stable - don't want them to break when we update code
-fast
-few
-focus on messages
-Query message - return something/change nothing
  -test the interface, not the implementation (allows for refactoring)
-Command: Returns nothing/change something
-Do not test private methods, they do not allow for refactoring. If you have a complicated private algorithm, this may require testing to get it running but should be segregated and noted that they can be deleted with refactoring. What at 15mins https://www.youtube.com/watch?v=URSWYvyc42M
