#GO ontological analysis
degdf <- FindMarkers(T_p56,ident.1 = "C-P",ident.2 = "C-CP", 
                     logfc.threshold = 0.25,group.by = "orig.ident",ident="T cell")
library(org.Mm.eg.db)
library(clusterProfiler)
degs.list=rownames(degdf)
erich.go = enrichGO(gene =degs.list,
                    OrgDb = org.Mm.eg.db,
                    keyType = "SYMBOL",
                    ont = "ALL",
                    pvalueCutoff = 0.05,
                    qvalueCutoff = 0.05)

df=read.csv( "GO analysis.csv")
p <- ggplot(df, aes(x = GeneRatioNumeric, y = Description, size = Count, color = p.adjust)) +
  geom_point(alpha=0.7)+
  scale_size(range = c(3, 10))+
  scale_color_gradientn(colors = c("red", "white", "blue")) +
  theme_minimal() +
  theme(legend.position = "right",
        axis.line = element_line(color = "black", size = 0.5), 
        panel.border = element_rect(color = "black", fill=NA, size=0.5) 
  ) + 
  labs(title = "GO Analysis (C-P vs C-CP)", 
       x = "Gene Ratio", y = "Biological Process", 
       size = "Gene Count", color = "P Adjusted")
