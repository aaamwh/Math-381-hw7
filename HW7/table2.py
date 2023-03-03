import plotly.graph_objects as go
import numpy as np

headerColor = 'grey'
rowEvenColor = 'lightgrey'
rowOddColor = 'white'

value =[["Murder","Rape","Robbery","Assault","Burglary","Larceny","Auto"],[-0.5011989, -0.7720286, -0.7459283, -0.8204511, -0.7294403, -0.6764707, -0.6044029], [-0.7372762, -0.06647641, -0.2696631, -0.3076262, 0.397781, 0.6660193, 0.103475]]

 

fig = go.Figure(data=[go.Table(
  header=dict(
    values=[' ','x coordinate', 'y coordinate'],
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