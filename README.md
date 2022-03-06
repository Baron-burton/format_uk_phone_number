# UK Mobile Number Formatter Challenge
## The Details

Imagine you're collecting a customer's phone number on checkout so you can send them SMS messages to remind them that their order is coming, and other useful information about their delivery. You use Twilio to send the actual messages, and Twilio require the phone number to be formatted correctly before being sent to Twilio, including the +44 prefix.

On checkout, customers are able to input their phone number in any of the following formats:

+447...

447...

07....

UK mobile phone numbers are **11 digits long** when in the 07... format (There are some exceptions, but you can ignore them), and always have a 7 after the prefix (whether it's +44, 44 or 0). What we're looking for you to do is the following:

1. Using Test Driven Development, Build a spec for a Formatter::PhoneNumber::UK#format method that takes in a phone number, removes any spaces, checks it is valid (raises an error if not), and outputs it in the +447... format.
2. Implement the Formatter::PhoneNumber::UK#format method to ensure the tests pass.
3. Implement error classes for the different errors that can occur during the formatting

For example, if I call format with 071234 56789 as the input, it should return +447123456789. If I call it with 0634343, it should raise an error.
