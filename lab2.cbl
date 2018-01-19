       identification division.
       program-id. lab2.
       author. Kelley Scales.
       date-written. 2017-09-26.
      *Description:

       environment division.
       input-output section.
       file-control.
      *    selects the input file location and name
           select input-file assign to '../../../data/lab2.data'
               organization is line sequential.
      *    selects the output file location and name
           select report-file assign to '../../../data/lab2.out'
               organization is line sequential.

       data division.
       file section.
       
      *Input file declaration
       fd input-file 
           data record is emp-rec.

      *employee input record variables decalred   
       01 emp-rec.
           05 emp-rec-num                  pic x(3).
           05 emp-rec-name                 pic x(12).
           05 emp-rec-calls.             
               10 input-calls              pic 9(3)
                   occurs 6 times.
       
      *Output file declaration
       fd report-file 
           data record is print-line.
           
       01 print-line                       pic x(132).

       working-storage section.
      *employee output records variable declaration
       01 detail-line.
           05 filler                       pic x(4) 
                   value spaces.
           05 ws-line-num                  pic x(3).
           05 filler                       pic x(6) 
                   value spaces.
           05 ws-line-name                 pic x(12).
           05 filler                       pic x(1) 
                   value spaces.
           05 ws-line-type                 pic x(6).
           05 filler                       pic x(6)
                   value spaces.
           05 ws-line-prov                 pic x(3).
           05 filler                       pic x(6)
                   value spaces.
           05 ws-detail-line-months        occurs 6 times.
               10 ws-output-calls          pic zz9.
               10 ws-output-calls-text     redefines ws-output-calls
                                           pic x(3).
               10 filler                   pic x(4)
                   value spaces.
           
           05 ws-line-total                pic z,zz9.
           05 ws-line-total-text           redefines ws-line-total
                                           pic x(5).
           05 filler                       pic x(5) 
                   value spaces.
           
           05 ws-line-comment              pic x(18).
           
      *constants declaration
       01 ws-constants.
           05 ws-number-of-months          pic 99   
                   value 6.
       
      *End of file declaration
       01 found-eof                        pic x 
                   value 'n'.
           88 is-end-of-file                  
                   value "y".

      *Totals declaration
       01 ws-totals.
           05 ws-grand-total               pic 9(5) 
                   value 0.
           05 ws-emp-total                 pic 9(4) 
                   value 0.
           05 ws-total-no-calls            pic 9(2) 
                   value 0.
       
      *Name Line
       01 name-line.
           05 filler                       pic x(2) 
                   value spaces.
           05 filler                       pic x(29)
                   value 'Kelley Scales, lab 2'.
           05 filler                       pic x(5)  
                   value spaces.
           05 name-line-date               pic 9(6).
           05 filler                       pic x(5)  
                   value spaces.
           05 name-line-time               pic 9(8).
       
      *Report heading line
       01 report-heading.
           05 filler                       pic x(35).
           05 filler                       pic x(39)
                   value 'CALL CENTRE VOLUMES FOR JULY - DECEMBER'.
       
      *Heading line
       01 heading-line1.
           05 filler                       pic x(2) 
                   value spaces.
           05 filler                       pic x(8) 
                   value 'OPERATOR'.
           05 filler                       pic x(2) 
                   value spaces.
           05 filler                       pic x(8) 
                   value 'OPERATOR'.
           05 filler                       pic x(4) 
                   value spaces.
           05 filler                       pic x(8)
                   value 'OPERATOR'.
           05 filler                       pic x(4)
                   value spaces.
           05 filler                       pic x(8)
                   value 'PROVINCE'.
           05 filler                       pic x(3)
                   value spaces.
           05 filler                       pic x(3) 
                   value 'JUL'.
           05 filler                       pic x(4) 
                   value spaces.
           05 filler                       pic x(3) 
                   value 'AUG'.
           05 filler                       pic x(4) 
                   value spaces.
           05 filler                       pic x(3) 
                   value 'SEP'.
           05 filler                       pic x(4) 
                   value spaces.
           05 filler                       pic x(3) 
                   value 'OCT'.
           05 filler                       pic x(4) 
                   value spaces.
           05 filler                       pic x(3) 
                   value 'NOV'.
           05 filler                       pic x(4) 
                   value spaces.
           05 filler                       pic x(3) 
                   value 'DEC'.
           05 filler                       pic x(4) 
                   value spaces.
           05 filler                       pic x(5) 
                   value 'TOTAL'.
           05 filler                       pic x(4) 
                   value spaces.
           05 filler                       pic x(7)
                   value 'COMMENT'.

      *Heading line 2
       01 heading-line2.
           05 filler                       pic x(5) 
                   value spaces.
           05 filler                       pic x(1) 
                   value '#'.
           05 filler                       pic x(8) 
                   value spaces.
           05 filler                       pic x(4) 
                   value 'NAME'.
           05 filler                       pic x(8)
                   value spaces.
           05 filler                       pic x(4)
                   value 'TYPE'.

      *Total line
       01 total-line1.
           05 filler                       pic x(6) 
                   value spaces.
           05 filler                       pic x(20)
                   value "TOTAL NO CALLS: ".
           05 total-line-no-calls          pic zz,zz9.

      *Total line 2
       01 total-line2.
           05 filler                       pic x(6) 
                   value spaces.
           05 filler                       pic x(20)
                   value "OVERALL TOTAL CALLS:".
           05 total-line-calls             pic zz,z99.
       
      *Total calls for ONT
       01 total-ontario-calls.
           05 filler                       pic x(6)
                   value spaces.
           05 filler                       pic x(20)
                   value "TOTAL ONTARIO CALLS: ".
           05 total-line-ont-calls         pic zz,z99.   
       
      *Total calls for QUE
       01 total-quebec-calls.
           05 filler                       pic x(6)
                   value spaces.
           05 filler                       pic x(20)
                   value "TOTAL QUEBEC CALLS: ".
           05 total-line-que-calls         pic zz,z99.
           
       01 highest-quebec.
           05 filler                       pic x(6)
                   value spaces.
           05 filler                       pic x(17)
                   value "HIGHEST QUEBEC : ".
           05 high-que-op-num              pic x(3).
           05 filler                       pic x(3)
                   value spaces.
           05 high-que-name                pic x(10).
           05 filler                       pic x(3)
                   value spaces.
           05 high-que-total               pic z,zz9.
           
       01 highest-ontario.
           05 filler                       pic x(6)
                   value spaces.
           05 filler                       pic x(17)
                   value "HIGHEST ONTARIO: ".
           05 high-ont-op-num              pic x(3).
           05 filler                       pic x(3)
                   value spaces.
           05 high-ont-name                pic x(10).
           05 filler                       pic x(3)
                   value spaces.
           05 high-ont-total               pic z,zz9.
           
       01 overall-average.
           05 filler                       pic x(6)
                   value spaces.
           05 filler                       pic x(17)
                   value "OVERALL AVERAGE: ".
           05 ws-overall-avg               pic z99.99.
           
       01 ws-table.
           05 filler                       pic x(12)
                   value 'A12FIRST ONT'.
           05 filler                       pic x(12)
                   value 'A14FIRST QUE'.
           05 filler                       pic x(12)
                   value 'B10THIRD QUE'.
           05 filler                       pic x(12)
                   value 'B12SECONDONT'.
           05 filler                       pic x(12)
                   value 'B14SECONDONT'.
           05 filler                       pic x(12)
                   value 'C09THIRD ONT'.
           05 filler                       pic x(12)
                   value 'C11FIRST QUE'.
           05 filler                       pic x(12)
                   value 'C13FIRST ONT'.
           05 filler                       pic x(12)
                   value 'C21FIRST ONT'.
           05 filler                       pic x(12)
                   value 'C22FIRST ONT'.
           05 filler                       pic x(12)
                   value 'C23SECONDQUE'.
           05 filler                       pic x(12)
                   value 'C25FIRST QUE'.
           05 filler                       pic x(12)
                   value 'C27SECONDQUE'.
       
       
       01 ws-table-map                     redefines ws-table.
           05 ws-table-item                occurs 13 times
              ascending key is ws-op-num indexed by i.
                   10 ws-op-num            pic x(3).
                   10 ws-op-type           pic x(6).
                   10 ws-op-prov           pic x(3).
       
      *subscript
       77 ws-sub                           pic 99
                   value 1.
         
       77 ws-total-ont                     pic 9(5)
                   value 0.
       
       77 ws-total-que                     pic 9(5)
                   value 0.
       77 ws-total-not-found               pic 9(5)
                   value 0.
       77 ws-not-found                     pic x(18)
                   value "OPERATOR NOT FOUND".
       77 ws-total-num-op                  pic 99
                   value 0.
       77 ws-total-avg                     pic 999v99
                   value 0.
                   
       77 ws-highest-ont                   pic 9(4)
                   value 0.
       
       77 ws-highest-que                   pic 9(4)
                   value 0.
                  
       procedure division.
       
       
      *    open file handles
           open input input-file,
                output report-file.

      *    grab the current date & time
           accept name-line-date from date.
           accept name-line-time from time.

      *    output heading
           perform 000-print-headings.

      *    process input file & output results
           perform 100-read-input-file.
           
           perform 200-process-records until is-end-of-file.

      *    output total lines
           perform 500-print-totals.

      *    close file handles
           close input-file
                 report-file.
                 
           stop run.
       
      *Print headings Paragraph
       000-print-headings.
           write print-line from name-line before advancing 1 line.

           write print-line from report-heading after advancing 1 line.

           write print-line from heading-line1 after advancing 2 lines.
           write print-line from heading-line2 after advancing 1 line.

      *Read Input File
       100-read-input-file.
           
           read input-file at end move 'y' to found-eof.
           
      *Process Paragraph
       200-process-records.
          
           
           search all ws-table-item 
               
      *        When record is not found
               at end
                   
      *            don't show numbers in records
                   move spaces to ws-line-prov
                   move spaces to ws-line-type
                   
      *            output not found comment
                   move ws-not-found to ws-line-comment
                   move spaces to ws-line-total-text
      *            Go through each month
                   perform varying ws-sub from 1 by 1 until
                       ws-sub > ws-number-of-months
                           
      *                    add monthly calls to total and total non
                           add input-calls(ws-sub)
                               to ws-emp-total
                                   ws-total-not-found
                                   
      *                    don't show month records        
                           move spaces to ws-output-calls-text(ws-sub)
                           
                   end-perform
                   
      *            add to running total of operators
                   add 1 to ws-total-num-op
                         
                         
      *        when the table number equals operator number     
               when ws-op-num(i) equals emp-rec-num
                  
      *           move province and type to output
                   move ws-op-prov(i) to ws-line-prov
                   move ws-op-type(i) to ws-line-type
                   move spaces to ws-line-comment
                   
      *            Go through each month
                   perform varying ws-sub from 1 by 1 until
                       ws-sub > ws-number-of-months
                           
      *                    if the province equals ONT
                           if ws-op-prov(i) equals 'ONT' then
                           
      *                        move monthly calls to output
                               move input-calls(ws-sub) 
                                   to ws-output-calls(ws-sub)
                                   
      *                        add monthly calls to total calls 
      *                        and total calls for ontario
                               add input-calls(ws-sub) 
                                   to ws-emp-total 
                                       ws-total-ont
                          
      *                        Check for highest total for ontario
      *                        if total is higher than variable
                               if ws-emp-total > ws-highest-ont then
                               
      *                            move the total to the variable
                                   move ws-emp-total to ws-highest-ont
                                   
      *                            move name, number and total to output
                                   move emp-rec-name to high-ont-name
                                   move emp-rec-num to high-ont-op-num
                                   move ws-emp-total to high-ont-total
                                   
                               end-if
                         
                         
      *                    if the province equals QUE then 
                           else if ws-op-prov(i) equals 'QUE' then
                               
      *                        move monthly calls to output
                               move input-calls(ws-sub) 
                                   to ws-output-calls(ws-sub)
                                   
      *                        add all of monthly calls to total
      *                        and add to total for quebec calls
                               add input-calls(ws-sub) 
                                   to ws-emp-total
                                       ws-total-que
                                       
      *                        if the total is greater than variable
                               if ws-emp-total > ws-highest-que then
                               
      *                            move total to highest que
                                   move ws-emp-total to ws-highest-que
                               
                                   move emp-rec-name to high-que-name
                                   move emp-rec-num to high-que-op-num
                                   move ws-emp-total to high-que-total
                               
                               end-if
                           
                           end-if
              
                   end-perform
                   
      *            add 1 to running count of operators
                   add 1 to ws-total-num-op
                   
      *            move data to outputs 
                   move ws-emp-total to ws-line-total
                   move ws-total-not-found to total-line-no-calls 
                   move ws-total-ont to total-line-ont-calls
                   move ws-total-que to total-line-que-calls
                   
                   
           end-search.
    
      *    add total to grand total
           add ws-emp-total to ws-grand-total
       
      
      *    move variables to output
           move emp-rec-num to ws-line-num.
           move emp-rec-name to ws-line-name.
            
       
      *    print detail line
           write print-line from detail-line 
               after advancing 2 lines.

      *    reset field for next record
           move 0 to ws-emp-total.

      *    read next record 
           perform 100-read-input-file.
           
           
       500-print-totals.
           divide ws-grand-total by ws-total-num-op giving
               ws-total-avg
           
           
           move ws-grand-total to total-line-calls.
           move ws-total-avg to ws-overall-avg.
           
           write print-line from total-ontario-calls
               after advancing 2 lines.
           write print-line from total-quebec-calls
               after advancing 1 line.
           write print-line from total-line1
               after advancing 1 lines.
           write print-line from total-line2
               after advancing 1 lines.
           write print-line from overall-average
               after advancing 2 lines.
           write print-line from highest-quebec
               after advancing 2 lines.
           write print-line from highest-ontario
               after advancing 1 lines.
           

       end program lab2.