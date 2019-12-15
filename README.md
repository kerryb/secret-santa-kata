# Secret Santa Kata

Santa's elves have been so busy wrapping presents that they've forgotten to tag
who they're to and also who they are from (because Santa doesn't exist, silly).

Can you help them by writing a SecretSanta function that accepts an array of
strings containing the people's names (in firstname, lastname format) and
returns an array of objects in the format

```
{
To: " ",
From: " ",
}
```

For the purposes of this challenge the return object can be a string (so that
you don't have to use Javascript or a JSON library).

To and From should be randomly allocated from the input list. Each name from
the passed array should feature exactly once in the To field and once in the
From field, but never To and From together in the same object. The result
should be properly randomised and not the names in same order they were passed
in.

## Example:

```
SecretSanta(["Firstname1 Lastname1", "Firstname2 Lastname2", "Firstname3 Lastname3"])
```

Returns:

```
[
  {To: "Firstname1 Lastname1", From: "Firstname3 Lastname3"},
  {To: "Firstname3 Lastname3", From: "Firstname2 Lastname2"}, 
  {To: "Firstname2 Lastname2", From: "Firstname1 Lastname1"}
]
```

NOTE: in the example above if 1 bought for 2 and 2 bought for 1, 3 would be
unable to buy or receive. This is not permissable.

