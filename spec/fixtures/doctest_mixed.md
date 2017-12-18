# A first complete example

## A passing literate block

```ruby literate
  expect{ nil }.not_to raise_error(ArgumentError)
```

## Not passing
```ruby literate
  expect{ nil }.to raise_error(ArgumentError)
```

## This one is not executed
```ruby litertae
  raise RuntimeError, "no"
```
## This neither

  raise RuntimeError, "no"

## And nor this
```python literate
  raise RuntimeError, "no"
```

## And this is
```ruby literate
  raise RuntimeError, "expected error"
```

And so is this
==============
```ruby literate
  raise ArgumentError, "expected error"
```
