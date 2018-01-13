#include <QtCore/QCoreApplication>
#include "cudaheaders.h"

extern "C"
int cuda_main();

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // run your cuda application
    int j=cuda_main();
    if(!j)
        cout << "Success\n";

    return a.exec();
}
