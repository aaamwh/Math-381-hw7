import plotly.graph_objects as go
import numpy as np

headerColor = 'grey'
rowEvenColor = 'lightgrey'
rowOddColor = 'white'

value =[['Model1', 'Model2', 'Model3'],[0.4768181, 0.6827583, 0.8233565]]

 

fig = go.Figure(data=[go.Table(
  header=dict(
    values=[' ','GOF'],
    line_color='darkslategray',
    fill_color=headerColor,
    align=['left','center'],
    font=dict(color='white', size=12)
  ),
  cells=dict(
    values=value,
    line_color='darkslategray',
    # 2-D list of colors for alternating rows
    fill_color = [[rowOddColor,rowEvenColor,rowOddColor, rowEvenColor,rowOddColor]*5],
    align = ['left', 'center'],
    font = dict(color = 'darkslategray', size = 11)
    ))
])

fig.show()