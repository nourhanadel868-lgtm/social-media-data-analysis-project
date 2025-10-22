import pandas as pd 
import matplotlib.pyplot as plt 
import seaborn as sns

df = pd.read_csv("Cleaned Sheet.csv", parse_dates=['post_date'])

df['Hour'] = df['Hour'].astype(int)
df['time_category'] = df['time_category'].astype('category')

print(df[['likes','comments','shares','total_engagement']].describe())

platform_stats = df.groupby('platform').agg({'total_engagement': ['mean','median','std'], 'post_id': 'count'}).sort_values(('total_engagement','mean'), ascending=False)
print(platform_stats)

time_bins = [0, 6, 12, 17, 21, 24]
labels = ['Night','Morning','Afternoon','Evening','Late Night']
df['time_segment'] = pd.cut(df['Hour'], bins=time_bins, labels=labels, right=False)
time_engagement = df.groupby(['platform','time_segment'])['total_engagement'].mean().unstack()
print(time_engagement)

sentiment_impact = df.groupby(['platform','sentiment_score']).agg({'total_engagement':'mean', 'likes':'mean', 'comments':'mean', 'shares':'mean'})
print(sentiment_impact)

monthly_engagement = df.set_index('post_date').resample('M')['total_engagement'].mean()
print(monthly_engagement)

#platform_stats.to_csv('platform_performance_stats.csv')
#time_engagement.to_csv('optimal_posting_times.csv')


