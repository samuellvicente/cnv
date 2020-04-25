from matplotlib import pyplot as plot

dlx99=[[1766241, 7059472, 18527986, 58226082, 241721125, 325529475, 483440896], [1, 3, 5, 7, 9, 11, 13]]

r=dlx99


fig = plot.figure()
plot.plot(r[1], r[0])
fig.suptitle('Instrumented 9x9 CP basic block count', fontsize=20)
plot.xlabel('Unassigned entries', fontsize=18)
plot.ylabel('Instruction', fontsize=16)
fig.savefig('instrumentedCPBCOUNT9x9.png')