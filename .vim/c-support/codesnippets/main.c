#include <errno.h>
#include <math.h>  
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

#include <ad_bugreport.h>


///定义程序的名称
static const char *program = "ad_appd";

static int write_pidfile(const char *prog, int full_path);
static int remvoe_pidfile(const char *prog, int full_path);


/**
 * 程序启动初始化
 * @param
 * @return 0:ok; -1:error,see errno
 */
static int app_init()
{
    if (write_pidfile(NULL, 0) != 0)
    {
        LOG(LOG_ERR, "%s: write_pidfile error", __FUNCTION__);
        return -1;
    }
}

/**
 * 程序退出清理
 * @param
 * @return 0:ok; -1:error,see errno
 */
static void app_exit()
{
    remvoe_pidfile(NULL, 0);
}

/**
 * 信号处理
 * @param sig 收到的系统信号
 */
static void signal_handler(int sig)
{
    switch (sig) {
        case SIGTERM:
            LOG(LOG_DEBUG, "recv signal term");
            app_exit();
            _exit(0);
            break;
        default:
            LOG(LOG_DEBUG, "recv signal %d", sig);
            break;
    }
}


// 信号处理
static void set_signal_handle()
{
    signal(SIGTERM, signal_handler);
    init_bugreport(program, 1);
}



/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:  main function
 * =====================================================================================
 */
int main(int argc, char *argv[])
{
    int c;
    int cfg_daemon = 1;
    const char *shortopts = "a?";

    //参数处理
    while ((c = getopt(argc, argv, shortopts)) != EOF)
    {
        switch (c)
        {
        case 'a':
            cfg_daemon = 0;
            break;
        case '?':
        default:
            return usage(0);
        }
    }
    argc -= optind;
    argv += optind;

    //是否需要后台运行
    if (cfg_daemon)
    {
        daemon(0, 0);
    }

    //信号处理
    set_signal_handle();

    //启动初始化
    if (app_init() != 0)
    {
        fprintf(stderr, "app init fail! exit.\n");
        return -1;
    }


    //退出清理
    app_exit();
    return 0;

}		/* ----------  end of function main  ---------- */

/**
 * 写pid文件
 * @param prog 程序名称（或者是pid文件的全路径）
 * @param full_path 是否pid文件的全路径
 * @return 0:ok; -1:error,see errno
 */
static int write_pidfile(const char *prog, int full_path)
{
    int fd = -1;
    char fname[1024] = { 0 };

    if (!prog)
        prog = program;

    if (!full_path)
        snprintf(fname, sizeof(fname) - 1, "/var/run/%s.pid", prog);
    else
        snprintf(fname, sizeof(fname) - 1, "%s", prog);

    fd = open(fname, O_CREAT | O_WRONLY, 0644);
    if (fd != -1)
    {
        char buf[64] = { 0 };
        snprintf(buf, sizeof(buf), "%d\n", getpid());
        write(fd, buf, strlen(buf));
        close(fd);
        return 0;
    }
    return -1;
}

/**
 * 删除pid文件
 * @param prog 程序名称（或者是pid文件的全路径）
 * @param full_path 是否pid文件的全路径
 * @return 0:ok; -1:error,see errno
 */
static int remvoe_pidfile(const char *prog, int full_path)
{
    char fname[1024] = { 0 };
    if (!prog)
        prog = program;

    if (!full_path)
        snprintf(fname, sizeof(fname) - 1, "/var/run/%s.pid", prog);
    else
        snprintf(fname, sizeof(fname) - 1, "%s", prog);
    return unlink(fname);
}

