int func(int a, char *s)
{
    return 1;
}

int main(int argc, char *argv)
{
    int i = 2 + 3;
    char *s;
    i = func(i + 2, s);
    int x = func(i / 2, s);

    return i;
}