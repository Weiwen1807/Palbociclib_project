#ratio
library(RColorBrewer)
pB2_df=read.xlsx("Supplementary_Table2.xlsx")
col=c("#7570B3","#66A61E","#E6AB02","#1F78B4","#A6761D","#666666", "#A6CEE3","#B2DF8A", "#FF7F00")
pB4 <- ggplot(data = pB2_df, aes(x =Sample, y = Number, fill =  Cluster)) +
  geom_bar(stat = "identity", width=0.8,position="fill")+
  scale_fill_manual(values=col) +
  theme_bw()+
  theme(panel.grid =element_blank()) +
  labs(x="",y="Ratio")+
  theme(axis.text.y = element_text(size=12, colour = "black"))+
  theme(axis.text.x = element_text(size=12, colour = "black"))+
  theme(
    axis.text.x.bottom = element_text(hjust = 1, vjust = 1, angle = 45)
  ) 
pB4
