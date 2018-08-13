# scripts
access_count.sh
统计nginx日志里没有访问请求的时间段,要求，输入nginx的访问日志，输出没有访问请求的时间，格式为 hour:min
思路：
预先生成一个模板文件，模板文件里包含一天24小时是 hour:min(24*60行)
把访问日志里有的时间都切割出来，按照hour:min打印到一个临时文件里
两个文件对比，输出模板文件里有，临时文件里没有的行

random_passsword.sh

