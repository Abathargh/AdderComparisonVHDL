from random import randint

with open("rand_sim16", "w") as file:
    file.write('\nwait for 100 ns;');


    for i in range(2000):
        a = randint(0, 65535)
        b = randint(0, 65535)
        c = randint(0, 65535)
        file.write('\nA <= "{0:016b}";'.format(a))
        file.write('\nB <= "{0:016b}";'.format(b))
        file.write('\nC <= "{0:016b}";'.format(c))
        file.write('\nwait for clk_period;')

    file.write('\nwait;');

