## ------------------------------------------------------------------------
s = "hey ho, let's go!"
gsub("hey","ho",s)

## ------------------------------------------------------------------------
s = "hey ho, let's go!"
gsub("hey|ho","yo",s)

## ------------------------------------------------------------------------
s = "hey ho, let's go!"
s_new = gsub("hey","get",s)
s_new = gsub("ho","ready",s_new)
s_new

## ------------------------------------------------------------------------
s = "hey ho, let's go!"
s_new = gsub("hey","ho",s)
s_new = gsub("ho","hey",s_new)
s_new

## ------------------------------------------------------------------------
library(mgsub)
s = "hey ho, let's go!"
mgsub::mgsub(s,list("hey"="ho","ho"="hey"))

## ------------------------------------------------------------------------
s = "hey ho, let's go!"
replacements = c("ho","hey")
matches = c("hey","ho")
names(replacements) = matches
mgsub::mgsub(s,replacements)

## ------------------------------------------------------------------------
s = "hey ho, let's go!"
mgsub::mgsub(s,c("hey"="ho","ho"="hey"))

## ------------------------------------------------------------------------
s = "Dopazamine is not the same as dopachloride or dopastriamine, yet is still fake."
mgsub::mgsub(s,list("[Dd]opa([^ ]*?mine)"="Meta\\1","fake"="real"))

## ------------------------------------------------------------------------
s = "All my life I chased $money$ and .power. - not love!"
mgsub::mgsub(s,list("$money$"="balloons",".power."="dolphins","love"="success"),fixed=TRUE)

## ------------------------------------------------------------------------
s="they don't understand the value of what they seek."
mgsub::mgsub(s,list("the"="a","they"="we"))

## ------------------------------------------------------------------------
qdap::mgsub(c("the","they"),c("a","we"),s)

## ------------------------------------------------------------------------
s="Dopazamine is a fake chemical"
mgsub::mgsub(s,list("dopazamin"="freakout","do.*ne"="metazamine"),ignore.case=TRUE)

## ------------------------------------------------------------------------
qdap::mgsub(c("dopazamin","do.*ne"),c("freakout","metazamine"),s,fixed = FALSE,ignore.case=TRUE)

## ------------------------------------------------------------------------
s="hey, how are you?"
mgsub::mgsub(s,list("hey"="how","how"="are","are"="you","you"="hey"))

## ------------------------------------------------------------------------
print(qdap::mgsub(c("hey","how","are","you"),c("how","are","you","hey"),s))
print(qdap::mgsub(c("hey","how","are","you"),c("how","are","you","hey"),s
            ,fixed=FALSE,ignore.case=TRUE))

## ------------------------------------------------------------------------
library(microbenchmark)

s = "Dopazamine is not the same as Dopachloride and is still fake."
m = c("[Dd]opa(.*?mine)","fake")
r = c("Meta\\1","real")
names(r) = m

microbenchmark(
  mgsub = mgsub::mgsub(s,r),
  qdap = qdap::mgsub(m,r,s,fixed=FALSE)
)

