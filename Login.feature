@login
Feature: User Login
	As a registered user
	I want to sign in
	So that I can access my account and dashboard

Background:
	Given I open the application's login page

Scenario: Successful login with valid credentials
	When I enter username "user@example.com" and password "Password123"
	And I click the "Login" button
	Then I should see the dashboard
	And I should see a welcome message

Scenario Outline: Unsuccessful login with invalid credentials
	When I enter username "<username>" and password "<password>"
	And I click the "Login" button
	Then I should see an error message "Invalid username or password"

Examples:
	| username          | password    |
	| wrong@example.com | Password123 |
	| user@example.com  | wrongpass   |
    | wrong@example.com | Password123 |
	| user@example.com  | wrongpass   |

Scenario: Required fields validation
	When I leave the username and password fields empty
	And I click the "Login" button
	Then I should see validation messages for required fields

Scenario: Logout
	Given I am logged in as "user@example.com"
	When I click the "Logout" button
	Then I should be redirected to the login page

    Scenario Outline: Unsuccessful login with few more invalid credentials
	When I enter username "<username>" and password "<password>"
	And I click the "Login" button
	Then I should see an error message "Invalid username or password"

Examples:
	| username          | password    |
	| wrong@example.com | Password123 |
	| user@example.com  | wrongpass   |
    | wrong@example.com | Password123 |
	| user@example.com  | wrongpass   |
