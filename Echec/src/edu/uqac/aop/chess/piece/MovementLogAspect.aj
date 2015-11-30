package edu.uqac.aop.chess.piece;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import edu.uqac.aop.chess.Board;
import edu.uqac.aop.chess.agent.Move;

public aspect MovementLogAspect 
{
	/*pointcut logMovement(Move m) : call (boolean edu.uqac.aop.chess.agent.Player.makeMove(Move)) && args(m);
	
	after(Move m) : logMovement(m)
	{
		File f = new File("logval.txt");
		FileWriter fw;
		try {
			fw = new FileWriter(f, true);
			
			fw.write("Coup: xIyI= " + m.xI + m.yI + " xFyF= " + m.xF + m.yF + System.getProperty("line.separator"));
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}*/
	
pointcut logMovement(Move m) : call (void edu.uqac.aop.chess.Board.movePiece(Move)) && args(m);
	
	after(Move m) : logMovement(m)
	{
		File f = new File("logval.txt");
		FileWriter fw;
		try {
			fw = new FileWriter(f, true);
			
			fw.write("Coup: xIyI= " + m.xI + m.yI + " xFyF= " + m.xF + m.yF + System.getProperty("line.separator"));
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
}
