
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.Message;
import jdk.internal.util.xml.impl.Input;
import org.zeromq.ZMQ;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class Client {

    private String frontendAddress;
    private String address;
    private ZMQ.Socket sub;
    private State state;
    private Thread t1;
    private Thread t2;
    private Thread t3;


    public Client( String address ,  String frontendAddress, int frontendPort) throws IOException {
        this.frontendAddress = frontendAddress;
        this.address = address;
        ZMQ.Context context = ZMQ.context(1);
        sub = context.socket(ZMQ.SUB);
        sub.connect(frontendAddress);
        Socket socketJava = new Socket(frontendAddress, frontendPort);
        this.state = new State();
        this.t1 = new Thread(new Writer(socketJava, state, sub));
        this.t2 = new Thread(new Reader(socketJava, state));
        this.t3 = new Thread(new Notifier(sub, state));
        t1.start();
        t2.start();
        t3.start();
        try {
            t1.join();
            t2.join();
            t3.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}