#Differential gene analysis
library(tidyverse)
Degdf=read.csv("Ne_ISGgroup-HIGH-LOW-DEG.csv")
object_markers_1   <- degdf %>%
  mutate(Difference = pct.1 - pct.2) 
data_selected <- object_markers_1[c('Acsl1',	'Exoc4',	'Ccl3',	'Chil3',	'Clec4n',	'Ptpn22',	'Dock10',	'Tnf',	'Entpd3',	'Id2',	'Mmp9',	'Jun',	'Siglecf',	'Cdk6',	'Csf1',	'Pcna',	'Oas3',	'Cxcr2',	'Isg20',	'Cd14',	'Ifit2',	'Sell',	'Isg15',	'Ifit3',	'S100a8',	'Cxcl3',	'S100a9',	'Ifitm1',	'Ifit1',	'Wfdc17',	'Retnlg',"Il15"),]
p=ggplot(object_markers_1, aes(x=Difference, y=avg_log2FC, color = change)) + 
  geom_point(size=1) + 
  scale_color_manual(values=c( "blue","grey","red") )+
  theme(plot.title = element_text(hjust = 0.5,size=10), 
        legend.position="right", 
        legend.title = element_text(size = 15),
        panel.grid=element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        legend.text=element_text(size=15),
        legend.key.size = unit(15, "pt"))
p1=p+geom_label_repel(data=data_selected,
                      aes(label=symbol), 
                      color="black",
                      segment.colour = "black",
                      label.padding = 0.1, 
                      max.overlaps = 100,
                      segment.size = 0.3, 
                      size=4)
p2=p1+geom_vline(xintercept = 0.0,linetype=2)+geom_hline(yintercept = 0,linetype=2)+
  theme_bw()+theme(panel.border = element_blank(),panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))
