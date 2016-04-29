int recursiveTailCall(int data) {
    f1(data);
    return recursiveTailCall(data);
}
