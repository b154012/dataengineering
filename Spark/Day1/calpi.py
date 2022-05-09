import pyspark
import random

#this calculates the sample of random pi
def calPiRandom(p):
    x,y = random.random(), random.random()
    return x*x + y*y < 1

def main():

    if not 'sc' in globals():
        sc = pyspark.SparkContext()

    no_sample = 1000000

    #call parallelize to split up the process over the nodes available.
    #filter the sample of random pi and then count it
    count = sc.parallelize(range(0, no_sample)) \
             .filter(calPiRandom).count()

    #pi estimation
    print("Pi is roughly %f" % (4.0 * count / no_sample))

if __name__ == "__main__":
    main()
