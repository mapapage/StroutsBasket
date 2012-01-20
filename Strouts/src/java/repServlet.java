

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class repServlet extends HttpServlet{
    @Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

		response.setContentType("application/pdf");
	
		ServletContext ctx = getServletContext();
		InputStream is = ctx.getResourceAsStream("http://texwww.inf.uth.gr:8080/~mapapage/README.pdf");

		int read = 0;

		byte[] bytes = new byte[1024];

		OutputStream os = response.getOutputStream();

		while( ( read = is.read(bytes) ) != -1 ){
			os.write(bytes, 0, read);
		}

		os.flush();
		os.close();


	}

}







