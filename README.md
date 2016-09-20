# huntable
Comparator function for tables with dynamic values

## Usage

`huntable(source[, condition1[, condition2[, ...]]])`
* `source` Table to lookup;
   - if `source` is nil, function returns nil too;
   - if `source` is not a table, the function will try converts to a table;
* `condition1` ... `conditionN` Table with conditions to check;

## Sample

```lua
-- Consider this table as 'source':
local source = {
  level1_A = {
    level2_A = 1,
    level2_B = "sample",
    level2_B = "1.0",
  },
  level1_B = "sample_B",
  level1_C = {
    level2_A = "sample_C"
    level2_B = {
      level3_A = 10,
      level3_B = nil
    }
  }
}

huntable(source, {"level1_A"}) -- returns true, a key named 'level1_A' exists in source
huntable(source, {"level2_A"}) -- returns true, a key named 'level2_A' exists in source
huntable(source, {"level1_Z"}) -- returns false, a key named 'level1_Z' not exists in source
huntable(source, {level2_A = 1}) -- returns true, a key named 'level2_A' exists in source AND value is integer 1
huntable(source, {level2_A = "sample_C"}) -- returns true, a key named 'level2_A' exists in source AND value is string "sample_C"
huntable(source, {level1_B = "sample_B"}) -- returns true, a key named 'level1_B' exists in source AND value is string "sample_B"
huntable(source, {level2_A = 2}) -- returns false, a key named 'level2_A' exists in source AND value is not integer 2
huntable(source, {level2_A = "sample_Z"}) -- returns false, a key named 'level2_A' exists in source AND value is string "sample_Z"
huntable(source, {level2_A = ">0"}) -- returns true, a key named 'level2_A' exists in source AND value is greater then 0
huntable(source, {level2_A = ">=0"}) -- returns true, a key named 'level2_A' exists in source AND value is greater or equal then 0
huntable(source, {level2_A = "~0"}) -- returns true, a key named 'level2_A' exists in source AND value is non equal to 0
huntable(source, {level2_A = "=0"}) -- returns false, a key named 'level2_A' exists in source AND value is equal to 0
huntable(source, {level2_A = "=0"}) -- returns false, a key named 'level2_A' exists in source AND value is equal to 0
huntable(source, {level1_B = "!Sample_C"}) -- returns true, a key named 'level1_B' exists in source AND value is equal to string "sample_C" (case insensitive comparison)
huntable(source, {level1_B = "~sample_C"}) -- returns false, a key named 'level1_B' exists in source AND value is equal to string "sample_C", but requires a different value
huntable(source, {level1_B = "~"}) -- returns true, a key named 'level1_B' exists in source AND value is not equal to string ""
huntable(source, {level1_B = "?C"}) -- returns true, a key named 'level1_B' exists in source AND value is contains "C" (pattern comparison)
huntable(source, {level1_B = "?^C"}) -- returns true, a key named 'level1_B' exists in source AND value not starts with "C" (pattern comparison)
huntable(source, {level1_B = "?C$"}) -- returns true, a key named 'level1_B' exists in source AND value ends with "C" (pattern comparison)
huntable(source, {level1_B = "=sample_C"}) -- returns true, a key named 'level1_B' exists in source AND value is equal to "sample_C"
huntable(source, {level2_A = {9, 8 , 7, 1}}) -- returns true, a key named 'level2_A' exists in source AND value exists in list (1)
huntable(source, {level2_A = {9, 8 , 7, 6}}) -- returns false, a key named 'level2_A' exists in source AND value not exists in list (1)
huntable(source, {level2_A = 1, level1_B = "sample_B"}) -- returns true, a key named 'level2_A' exists in source AND value is integer 1; a key named 'level1_B' exists in source AND value is string "sample_B"
```

