library(reshape2)
library(ggplot2)
library(plotly)
library(wesanderson)
library(RColorBrewer)
library(scales)
library(plyr)
########################################
#abundance graphs- use the .tax.summary files for this

#import your data set

#use the melt function to format your data nicely, we are using the taxon column to group everything

melted_df <- melt(dataframe,id.vars = c("taxon"))
#it now calls the columns "taxon", "variable" which is the sample, and "value" which is the abundance or whatever

plotname=ggplot(melted_df,aes(x=variable,y=value,fill = taxon))+ 
  geom_bar(position = "fill",stat = "identity") + 
  scale_y_continuous(labels = percent_format(),expand=c(0,0)) +
  scale_x_discrete(expand=c(0,0))+
  xlab("\nSample")+
  ylab("Abundance \n")+
  theme(axis.text=element_text(size=20), axis.title=element_text(size=20))

##########################################
#NMDS/PCOA plots
#you will want to add a column to your table that puts the "group" name for each sample
#import your data set

#makes a function called find_hull using the specified data
find_hull_put_useful_tag_here=function(imported_data_name) imported_data_name[chull(imported_data_name$axis1,imported_data_name$axis2), ] #makes a function called find_hull using the specified data

#finds the hulls
hulls_useful_tag_here=ddply(imported_data_name,"group",find_hull_put_useful_tag_here)

#make graph

pcoaplot=ggplot(imported_data_name,aes(x=axis1,y=axis2,color=group,fill=group))+
  geom_polygon(data=hullsdevp,alpha=0.3)+
  geom_point(size=4) +
  xlab("\nAxis 1")+
  ylab("\nAxis 2")+
  theme(text=element_text(size=20),panel.background=element_rect(fill="white"),axis.line=element_line(size=.5,color="black"),panel.grid=element_line(size=.5, color="grey"))
############################################

#you should know how to make box plots for the other files etc. 