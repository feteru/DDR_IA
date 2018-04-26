f1 = @() mean(orientlog_small(:,1));
f2 = @() std(orientlog_small(:,1));

t1 = timeit(f1)
t2 = timeit(f2)