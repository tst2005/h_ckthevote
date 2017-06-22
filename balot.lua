local re = require"re"

local balotgrammar = re.compile[[
  balot <- {| head withdrawns* votes+ candidates  |}

  head <- {:head: headline :}
  headline <- {| candidates_count space+ seats_count |} comment* %nl

  comment <- space* "#" [^%nl]*

  candidates_count <- {:candidates: {num} :}
  seats_count <- {:seats: {num} :}

  num <- [0-9]+
  space <- " "

  negnum <- "-" num

  withdrawns <- {:withdraw: {| withdrawn* |} :} comment* %nl
  withdrawn <- {negnum} space*

  votes <- {:ballots: {| vote+ |} :}
  vote <- {| voteitem+ |} comment* %nl
  voteitem <- { dupvote } space*
  dupvote <- "-" / num "=" num / num

  candidates <- {:canditates: {| candidate+ |} :}
  candidate <- '"' { [^"]+ } '"' comment* %nl

  title <- {:title: titleline :}
  titleline <- '"' { [^"]+ } '"' comment* %nl
]]


return function(data)
	return balotgrammar:match( data )
end
