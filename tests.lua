local huntable = require("huntable")

function test(f, expected)
  local result = f()
  if result ~= expected then
    error(string.format("Expected: %s. Got %s", string.upper(tostring(expected)), string.upper(tostring(result))))
  end
end

test(function()
  return huntable({
    a = "a"
  }, {
    "a"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    b = "b"
  }, {
    "a"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    "b"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({

  }, {
    "b"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    "a",
    "b"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    "c"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    "c",
    "d"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {

  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    {
      a = "a"
    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    {
      a = "a",
      b = "b"
    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    {

    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    {
      c = "c"
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    {
      a = "a"
    },
    {
      b = "b"
    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    {
      a = "a"
    },
    {
      b = "b",
      c = "c"
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    {
      a = "a"
    },
    {
      b = "b",
      d = "d"
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "a",
    b = "b"
  }, {
    {
      d = "d"
    },
    {
      b = "b",
      a = "a"
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = "b"
    }
  }, {
    {
      b = "b"
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = "b"
    }
  }, {
    {
      a = {}
    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = "b"
    }
  }, {
    {
      a = {
        b = "b"
      }
    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = "b"
    }
  }, {
    {
      a = {
        b = "c"
      }
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = 1
      }
    }
  }, {
    {
      a = {
        b = 1
      }
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = 1
      }
    }
  }, {
    {
      a = {
        b = {}
      }
    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = 1
      }
    }
  }, {
    {
      a = {
        b = {
          c = 1
        }
      }
    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = 1
      }
    }
  }, {
    {
      a = {
        b = {
          c = 0
        }
      }
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = 1
      }
    }
  }, {
    {
      a = {
        b = {
          c = {}
        }
      }
    }
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {},
    b = nil
  }, {
    "a",
    "b"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = nil,
    b = {}
  }, {
    "b"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = true
  }, {
    a = false
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = true
  }, {
    a = true
  })
end,
--[[Expected = ]]true)


test(function()
  return huntable({
    a = 1
  }, {
    a = 1
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = 1
  }, {
    a = "1"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = 2
  }, {
    a = "~1"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = 2
  }, {
    a = ">1"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = 1
  }, {
    a = ">=1"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = 0
  }, {
    a = "<1"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = 1
  }, {
    a = "<1"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = 1
  }, {
    a = "<=1"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = 1
  }, {
    a = "~1"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = 1
  }, {
    a = "=1"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = 1
  }, {
    a = "=2"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1"
  }, {
    a = 1
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = "abc"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "ABC"
  }, {
    a = "!abc"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "ABC"
  }, {
    a = "!ABC"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = "~abc"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = "~def"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = "=abc"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = "?b"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = "?e"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = "="
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = "~"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = {"?b", "?c"}
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = {"?b", "?e"}
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "abc"
  }, {
    a = {"?d", "?e"}
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = "abc"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = "def"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = {"def", "ghi"}
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = {"def", "ghi", "abc"}
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    "a",
    d = {"def", "ghi", "abc"}
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    "z",
    d = {"def", "ghi", "abc"}
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = true
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = {"def", true, "abc"}
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = true
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = function(k, r, s)
      for _, v in ipairs(r) do
        if v == true then
          return true
        end
      end
      return false
    end
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = function(k, r, s)
      for _, v in ipairs(r) do
        if v == "abc" then
          return true
        end
      end
      return false
    end
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = function(k, r, s)
      for _, v in ipairs(r) do
        if v == "abc" then
          return true
        end
      end
      return false
    end,
    f = "ghi"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = function(k, r, s)
      for _, v in ipairs(r) do
        if v == "abc" then
          return true
        end
      end
      return false
    end,
    f = "ghf"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = "abc"
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = function(k, r, s)
      for _, v in ipairs(r) do
        if v == "ghi" then
          return true
        end
      end
      return false
    end
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = {}
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = {"def", {}, "abc"}
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = {
      b = {
        c = {
          d = function() end
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = function() end,
    e = {"def"}
  })
end,
--[[Expected = ]]false)

test(function()
  local a = {}
  return huntable({
    a = {
      b = {
        c = {
          d = a
        }
      },
      e = "def"
    },
    f = "ghi"
  }, {
    d = a,
    e = {"def"}
  })
end,
--[[Expected = ]]false)

test(function()
  local b = {
    c = true
  }
  return huntable({
    a = b
  }, {
    {
      a = {
        c = true
      }
    }
  })
end,
--[[Expected = ]]true)

test(function()
  local b = {
    c = true
  }
  local c = {
    c = true
  }
  return huntable({
    a = b
  }, {
    {
      a = c
    }
  })
end,
--[[Expected = ]]true)

test(function()
  local b = {
    c = false
  }
  local c = {
    c = false
  }
  return huntable({
    a = b
  }, {
    {
      a = c
    },
    {
      a = b
    }
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = ">=1"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "=1"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.1"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, {
    b = "1.0"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, {
    a = "1.0"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, "a")
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, "b")
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, "a", "b")
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, "a", "a", "a", "a", "a", "b")
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, "a", "a", "a", "a", "a", {
    a = ">0"
  })
end,
--[[Expected = ]]true)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, "a", "a", "a", "a", "a", {
    a = "=0"
  })
end,
--[[Expected = ]]false)

test(function()
  return huntable({
    a = "1.0"
  }, {
    a = "1.0"
  }, "a", "a", "a", "a", "a", {
    a = "=1"
  })
end,
--[[Expected = ]]false)