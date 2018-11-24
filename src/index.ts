class HelloWorld {
    private message:string = 'Hello World!';

    public sayHello():void {
        console.log(this.message);
    }
}

const hw =  new HelloWorld();

hw.sayHello();
