##GSVA enrichement
library('GSEABase')
library(GSVA)
exp=Ne_orig@assays$RNA@data
exp=as.matrix(exp)
GSVA_hall <- gsva(expr=exp, 
                  gset.idx.list=geneSets, 
                  mx.diff=T,
                  kcdf="Gaussian", 
                  parallel.sz=4)GSVA_hall1=as.data.frame(GSVA_hall)
GSVA_hall1=t(GSVA_hall1)
GSVA_hall1=as.data.frame(GSVA_hall1)
df2=read.csv("P1-P7_GSVA-3genesets.csv")
ggplot(df1,aes(x=term,y=gene_score,fill=orig))+
  geom_boxplot(width=0.8,outlier.size = 0,outlier.stroke=0)+
  scale_fill_manual(values=c("#A6CEE3","#BEAED4","#F09685","#AFD7AA","#F3E7CF","#F5B9C2","#E4D466"))+ 
  theme(
    panel.background = element_rect(fill = "transparent",colour = NA),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.text.x = element_text(angle = 90,vjust = 1,hjust = 1,size = 14),
    axis.ticks = element_line(size = 0.3),
    axis.line = element_line(size = 0.3),
    plot.title = element_text(size=15,hjust = 0.5))+
  labs(x="Genesets",y="Genesets enricherment score")
