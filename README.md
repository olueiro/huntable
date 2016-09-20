# huntable
Comparator function for tables with dynamic values

## Usage

`huntable(source[, condition1[, condition2[, ...]]])
* `source` Table to lookup;
   - if `source` is nil, function returns nil too;
   - if `source` is not a table, the function will try converts to a table;
* `condition1` ... `conditionN` Table with rules to check;

## Sample

Consider this table as `source`

```lua
local source = {
  level1_A = {
    level2_A = 1,
    level2_B = "sample",
    level2_B = "1.0",
  },
  level1_B = "sample_B",
  level1_C = {
    level2_A = "sample_C"
  }
}

huntable(source, {"level1_A"}) -- returns true, a key named 'level1_A' exists in source
huntable(source, {"level1_Z"}) -- returns false, a key named 'level1_Z' not exists in source
huntable(source, {level2_A = 1}) -- returns true, a key named 'level2_A' exists in source AND value is integer 1
huntable(source, {level2_A = "sample_C"}) -- returns true, a key named 'level2_A' exists in source AND value is string "sample_C"
huntable(source, {level2_A = 2}) -- returns false, a key named 'level2_A' exists in source AND value is not integer 2
huntable(source, {level2_A = "sample_Z"}) -- returns false, a key named 'level2_A' exists in source AND value is string "sample_Z"
huntable(source, {level2_A = ">0"}) -- returns true, a key named 'level2_A' exists in source AND value is greater then 0
huntable(source, {level2_A = ">=0"}) -- returns true, a key named 'level2_A' exists in source AND value is greater or equal then 0
huntable(source, {level2_A = "~0"}) -- returns true, a key named 'level2_A' exists in source AND value is non equal to 0
huntable(source, {level2_A = "=0"}) -- returns false, a key named 'level2_A' exists in source AND value is equal to 0
huntable(source, {level2_A = "=0"}) -- returns false, a key named 'level2_A' exists in source AND value is equal to 0
```

