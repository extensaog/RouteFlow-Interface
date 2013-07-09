package bex.routeflow
import groovy.io.FileType
class InterfaceController {
		

    def index() {
		
		def mac = []
		def mcB1 = []
		def mcB2 = []
		def mcRfvmA = []
		def mcRfvmB = []
		def mcRfvmC = []
		def mcRfvmD = []
		/*############### Obter a lista de todos os arquivos ##############*/
		def list = []
		new File("/home/bex/Downloads/RouteFlow-master/rftest").eachFile() { file->
			if(file.getName().indexOf('rftest') == 0)
				list << file.getName()
		}
		/*################################################################*/
		
		/*############### Obter todos indices das substrings ##############*/
		def start = []
		String.metaClass.indexesOf = { match ->
			def ret = []
			def idx = -1
			while( ( idx = delegate.indexOf( match, idx + 1 ) ) > -1 ) {
			  ret << idx
			}
			ret
		  }
		
		/*################################################################*/
		
		String rftest1 = new File('/home/bex/Downloads/RouteFlow-master/rftest/rftest1').getText('UTF-8')
		String rftest2 = new File('/home/bex/Downloads/RouteFlow-master/rftest/rftest2').getText('UTF-8')
		String rftest1Csv = new File('/home/bex/Downloads/RouteFlow-master/rftest/rftest1config.csv').getText('UTF-8')
		
		def fileContents2 = rftest1.indexesOf('lxc-start -n')
		def fileContents3 = rftest2.indexesOf('lxc-start -n')
		
		for(int i = 0; i < fileContents2.size(); i++){
			start << rftest1.substring(fileContents2[i], fileContents2[i]+25).tokenize()[2]
			
		}
		
		for(int i = 0; i < fileContents3.size(); i++){
			start << rftest2.substring(fileContents3[i], fileContents3[i]+25).tokenize()[2]
			
		}
		
		/*############# Obter endereços MAC ##############*/
		
		//rftest1
		
		
			String rfvm1 = new File('/home/bex/Downloads/RouteFlow-master/rftest/config/'+start[0]+'/config').getText('UTF-8')
			String b1 = new File('/home/bex/Downloads/RouteFlow-master/rftest/config/'+start[1]+'/config').getText('UTF-8')
			String b2 = new File('/home/bex/Downloads/RouteFlow-master/rftest/config/'+start[2]+'/config').getText('UTF-8')
			String rfvmA = new File('/home/bex/Downloads/RouteFlow-master/rftest/config/'+start[3]+'/config').getText('UTF-8')
			String rfvmB = new File('/home/bex/Downloads/RouteFlow-master/rftest/config/'+start[4]+'/config').getText('UTF-8')
			String rfvmC = new File('/home/bex/Downloads/RouteFlow-master/rftest/config/'+start[5]+'/config').getText('UTF-8')
			String rfvmD = new File('/home/bex/Downloads/RouteFlow-master/rftest/config/'+start[6]+'/config').getText('UTF-8')
			
			def macRfvm1 = rfvm1.indexesOf('lxc.network.hwaddr')
			def macB1 = b1.indexesOf('lxc.network.hwaddr')
			def macB2 = b2.indexesOf('hwaddr')
			def macRfvmA = rfvmA.indexesOf('lxc.network.hwaddr')
			def macRfvmB = rfvmB.indexesOf('lxc.network.hwaddr')
			def macRfvmC = rfvmC.indexesOf('lxc.network.hwaddr')
			def macRfvmD = rfvmD.indexesOf('lxc.network.hwaddr')
			
			for(int i = 0; i < macRfvm1.size(); i++){
				mac << rfvm1.substring(macRfvm1[i], macRfvm1[i]+39).tokenize()[2]
				
			}
			
			for(int i = 0; i < macB1.size(); i++){
				mcB1 << b1.substring(macB1[i], macB1[i]+39).tokenize()[2]
				
			}
			
			for(int i = 0; i < macB2.size(); i++){
				mcB2 << b2.substring(macB2[i], macB2[i]+39).tokenize()[2]
				
			}
			
			for(int i = 0; i < macRfvmA.size(); i++){
				mcRfvmA << rfvmA.substring(macRfvmA[i], macRfvmA[i]+39).tokenize()[2]
				
			}
			
			for(int i = 0; i < macRfvmB.size(); i++){
				mcRfvmB << rfvmB.substring(macRfvmB[i], macRfvmB[i]+39).tokenize()[2]
				
			}
			
			for(int i = 0; i < macRfvmC.size(); i++){
				mcRfvmC << rfvmC.substring(macRfvmC[i], macRfvmC[i]+39).tokenize()[2]
				
			}
			
			for(int i = 0; i < macRfvmD.size(); i++){
				mcRfvmD << rfvmD.substring(macRfvmD[i], macRfvmD[i]+39).tokenize()[2]
				
			}
			
		
		
		
		
		[teste:fileContents2, files:start, mcRfvmD:mcRfvmD, mcRfvmC:mcRfvmC, mcRfvmB:mcRfvmB, mcRfvmA:mcRfvmA, mcRfvm1:mac, mcB1:mcB1, mcB2:mcB2]
	}
}
