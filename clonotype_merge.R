####merge clonotype files####


args = commandArgs(trailingOnly=TRUE)

input.dir<-args[[1]]

all.ig<-list.files(path=input.dir, pattern="*IG.all.clones*", full.names = TRUE)
top.ig<-list.files(path=input.dir, pattern="*IG.top.clones*", full.names = TRUE)
all.t<-list.files(path=input.dir, pattern="*T.all.clones*", full.names = TRUE)
top.t<-list.files(path=input.dir, pattern="*T.top.clones*", full.names = TRUE)

all.ig.merged<-NULL
top.ig.merged<-NULL
all.t.merged<-NULL
top.t.merged<-NULL

for( i in 1:length(all.ig)){
  
  print(i)
  curr.samp<-read.delim(all.ig[i], header=TRUE, sep="\t", check.names = FALSE)
  all.ig.merged<-rbind(all.ig.merged, curr.samp)
  
  curr.samp<-read.delim(top.ig[i], header=TRUE, sep="\t", check.names = FALSE)
  top.ig.merged<-rbind(top.ig.merged, curr.samp)
  
  curr.samp<-read.delim(all.t[i], header=TRUE, sep="\t", check.names = FALSE)
  all.t.merged<-rbind(all.t.merged, curr.samp)
  
  curr.samp<-read.delim(top.t[i], header=TRUE, sep="\t", check.names = FALSE)
  top.t.merged<-rbind(top.t.merged, curr.samp)
}

write.table(all.ig.merged, file=args[2], row.names = FALSE, quote = FALSE, sep="\t")
write.table(top.ig.merged, file=args[3], row.names = FALSE, quote = FALSE, sep="\t")
write.table(all.t.merged, file=args[4], row.names = FALSE, quote = FALSE, sep="\t")
write.table(top.t.merged, file=args[5], row.names = FALSE, quote = FALSE, sep="\t")
