<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="O_Remainder(5:0)" />
        <signal name="O_Quotient(5:0)" />
        <signal name="XLXN_8(5:0)" />
        <signal name="I_CLK" />
        <signal name="I_EN" />
        <signal name="I_Divisor(5:0)" />
        <signal name="I_Dividend(5:0)" />
        <port polarity="Output" name="O_Remainder(5:0)" />
        <port polarity="Output" name="O_Quotient(5:0)" />
        <port polarity="Input" name="I_CLK" />
        <port polarity="Input" name="I_EN" />
        <port polarity="Input" name="I_Divisor(5:0)" />
        <port polarity="Input" name="I_Dividend(5:0)" />
        <blockdef name="ALU">
            <timestamp>2018-3-3T5:37:5</timestamp>
            <rect width="336" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="Control">
            <timestamp>2018-3-3T5:37:33</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="DivRegister">
            <timestamp>2018-3-3T5:38:0</timestamp>
            <rect width="368" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="432" y="-364" height="24" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
        </blockdef>
        <block symbolname="ALU" name="XLXI_1">
            <blockpin signalname="XLXN_4" name="I_ALU_EN" />
            <blockpin signalname="O_Remainder(5:0)" name="I_ALU_A(5:0)" />
            <blockpin signalname="I_Divisor(5:0)" name="I_ALU_B(5:0)" />
            <blockpin signalname="XLXN_5" name="O_ALU_Flag" />
            <blockpin signalname="XLXN_8(5:0)" name="O_ALU_Out(5:0)" />
        </block>
        <block symbolname="Control" name="XLXI_2">
            <blockpin signalname="I_CLK" name="I_CTL_CLK" />
            <blockpin signalname="I_EN" name="I_CTL_EN" />
            <blockpin signalname="XLXN_3" name="O_CTL_RMD" />
            <blockpin signalname="XLXN_1" name="O_CTL_SLL" />
            <blockpin signalname="XLXN_4" name="O_CTL_ALU" />
            <blockpin signalname="XLXN_2" name="O_CTL_INI" />
        </block>
        <block symbolname="DivRegister" name="XLXI_3">
            <blockpin signalname="XLXN_2" name="I_REG_Init" />
            <blockpin signalname="XLXN_3" name="I_REG_Update" />
            <blockpin signalname="XLXN_1" name="I_REG_SLL" />
            <blockpin signalname="XLXN_5" name="I_REG_LSB" />
            <blockpin signalname="I_Dividend(5:0)" name="I_REG_Div(5:0)" />
            <blockpin signalname="XLXN_8(5:0)" name="I_REG_ALU(5:0)" />
            <blockpin signalname="O_Remainder(5:0)" name="O_REG_HI(5:0)" />
            <blockpin signalname="O_Quotient(5:0)" name="O_REG_LO(5:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2160" y="880" name="XLXI_2" orien="R0">
        </instance>
        <instance x="528" y="832" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="880" y1="1424" y2="1424" x1="800" />
            <wire x2="800" y1="1424" y2="1696" x1="800" />
            <wire x2="2672" y1="1696" y2="1696" x1="800" />
            <wire x2="2672" y1="720" y2="720" x1="2544" />
            <wire x2="2672" y1="720" y2="1696" x1="2672" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="528" y1="672" y2="672" x1="448" />
            <wire x2="448" y1="672" y2="960" x1="448" />
            <wire x2="2576" y1="960" y2="960" x1="448" />
            <wire x2="2576" y1="784" y2="784" x1="2544" />
            <wire x2="2576" y1="784" y2="960" x1="2576" />
        </branch>
        <branch name="O_Remainder(5:0)">
            <wire x2="464" y1="576" y2="736" x1="464" />
            <wire x2="528" y1="736" y2="736" x1="464" />
            <wire x2="1392" y1="576" y2="576" x1="464" />
            <wire x2="1392" y1="576" y2="1296" x1="1392" />
            <wire x2="1840" y1="1296" y2="1296" x1="1392" />
            <wire x2="1392" y1="1296" y2="1296" x1="1376" />
        </branch>
        <branch name="O_Quotient(5:0)">
            <wire x2="1392" y1="1616" y2="1616" x1="1376" />
            <wire x2="1840" y1="1616" y2="1616" x1="1392" />
        </branch>
        <branch name="XLXN_8(5:0)">
            <wire x2="832" y1="1200" y2="1616" x1="832" />
            <wire x2="880" y1="1616" y2="1616" x1="832" />
            <wire x2="1008" y1="1200" y2="1200" x1="832" />
            <wire x2="1008" y1="800" y2="800" x1="992" />
            <wire x2="1008" y1="800" y2="1200" x1="1008" />
        </branch>
        <branch name="I_CLK">
            <wire x2="2160" y1="656" y2="656" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2128" y="656" name="I_CLK" orien="R180" />
        <branch name="I_EN">
            <wire x2="2160" y1="848" y2="848" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2128" y="848" name="I_EN" orien="R180" />
        <branch name="I_Divisor(5:0)">
            <wire x2="528" y1="800" y2="800" x1="496" />
        </branch>
        <iomarker fontsize="28" x="496" y="800" name="I_Divisor(5:0)" orien="R180" />
        <instance x="880" y="1648" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_2">
            <wire x2="816" y1="1184" y2="1296" x1="816" />
            <wire x2="880" y1="1296" y2="1296" x1="816" />
            <wire x2="2560" y1="1184" y2="1184" x1="816" />
            <wire x2="2560" y1="848" y2="848" x1="2544" />
            <wire x2="2560" y1="848" y2="1184" x1="2560" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="512" y1="544" y2="1360" x1="512" />
            <wire x2="880" y1="1360" y2="1360" x1="512" />
            <wire x2="2560" y1="544" y2="544" x1="512" />
            <wire x2="2560" y1="544" y2="656" x1="2560" />
            <wire x2="2560" y1="656" y2="656" x1="2544" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="208" y1="560" y2="1488" x1="208" />
            <wire x2="880" y1="1488" y2="1488" x1="208" />
            <wire x2="1008" y1="560" y2="560" x1="208" />
            <wire x2="1008" y1="560" y2="672" x1="1008" />
            <wire x2="1008" y1="672" y2="672" x1="992" />
        </branch>
        <branch name="I_Dividend(5:0)">
            <wire x2="880" y1="1552" y2="1552" x1="848" />
        </branch>
        <iomarker fontsize="28" x="848" y="1552" name="I_Dividend(5:0)" orien="R180" />
        <iomarker fontsize="28" x="1840" y="1296" name="O_Remainder(5:0)" orien="R0" />
        <iomarker fontsize="28" x="1840" y="1616" name="O_Quotient(5:0)" orien="R0" />
    </sheet>
</drawing>