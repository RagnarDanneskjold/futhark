-- Memory block merging with a copy into a multidimensional array.  Requires
-- allocation hoisting of the memory block for 't1'.
-- ==
-- input { 1
--         [7, 0, 7]
--         [[-1, 0, 1],
--          [-1, 0, 1],
--          [-1, 0, 1]]
--       }
-- output { [[0, 1, 2],
--           [8, 1, 8],
--           [0, 1, 2]]
--        }

-- FIXME: Should be similar to pos1.fut, but does not work.

-- structure cpu { Alloc 2 }

import "/futlib/array"

let main (i: i32, ns: [#n]i32, mss: [#n][#n]i32): [n][n]i32 =
  let t0 = map (+ 1) ns -- Will use the memory of t1[i].

  -- This is the basis array in which everything will be put.  Its creation uses
  -- two allocations.
  let t1 = map (\ms -> map (+ 1) ms) mss
  let t1[i] = t0
  in t1
