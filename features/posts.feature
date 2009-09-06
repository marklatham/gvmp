We want to attract votermedia website users to come back again & again, and vote on their community website/blog ballot(s). For many users, the opportunity to vote again is not a strong attraction. We can make it more attractive by adding blog reader functions to the ballot page.

Feature: See posts from each website/blog
  As a voter looking at a votermedia.org community page
  I want to see some recent content from each website/blog
  In order to read the latest community news
  And decide which websites and posts to read more of
  And compare quality of websites to decide which ones to vote more funding to
  
  Scenario 1.0: User views a community page
    Given any user of the votermedia website
    When she views a community page
    Then it should be attractive, informative, interesting
    And it should show the subject and date of each website/blog's latest post (with link)
  
  Scenario 1.1: Show some post text also
    Given
    When
    Then
    And
    And the beginning of the post's text
  
  Scenario 1.3: Top websites show more posts
    Given
    When
    Then
    And it should show the subject and date of each website/blog's latest posts (with link) -- 3 posts for the top website, 2 posts for the second website, 1 post each for the rest
  
  Scenario 2.0: User surfs to a website post
    Given any user viewing a community page
    When she clicks on a website's recent post subject
    Then a new window opens at that website post
  