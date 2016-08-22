cmus-remote -Q | grep "tag title" | sed '/tag title/ s/tag title \(.*\)/\1/g' | dzen2 -p 5

