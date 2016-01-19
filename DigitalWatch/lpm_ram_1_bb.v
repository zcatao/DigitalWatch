// megafunction wizard: %RAM: 1-PORT%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_ram_dq 

// ============================================================
// File Name: lpm_ram_1.v
// Megafunction Name(s):
// 			lpm_ram_dq
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.0 Build 132 02/25/2009 SJ Full Version
// ************************************************************

//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.

module lpm_ram_1 (
	address,
	data,
	inclock,
	we,
	q);

	input	[4:0]  address;
	input	[23:0]  data;
	input	  inclock;
	input	  we;
	output	[23:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  we;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
// Retrieval info: PRIVATE: AclrAddr NUMERIC "0"
// Retrieval info: PRIVATE: AclrByte NUMERIC "0"
// Retrieval info: PRIVATE: AclrData NUMERIC "0"
// Retrieval info: PRIVATE: AclrOutput NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
// Retrieval info: PRIVATE: BlankMemory NUMERIC "1"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
// Retrieval info: PRIVATE: Clken NUMERIC "0"
// Retrieval info: PRIVATE: DataBusSeparated NUMERIC "1"
// Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
// Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_A"
// Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "ACEX1K"
// Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
// Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "256"
// Retrieval info: PRIVATE: MIFfilename STRING ""
// Retrieval info: PRIVATE: NUMWORDS_A NUMERIC "32"
// Retrieval info: PRIVATE: OutputRegistered NUMERIC "0"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_A NUMERIC "3"
// Retrieval info: PRIVATE: RegAdd NUMERIC "1"
// Retrieval info: PRIVATE: RegAddr NUMERIC "1"
// Retrieval info: PRIVATE: RegData NUMERIC "1"
// Retrieval info: PRIVATE: RegOutput NUMERIC "0"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: SingleClock NUMERIC "0"
// Retrieval info: PRIVATE: UseDQRAM NUMERIC "0"
// Retrieval info: PRIVATE: WRCONTROL_ACLR_A NUMERIC "0"
// Retrieval info: PRIVATE: WidthAddr NUMERIC "5"
// Retrieval info: PRIVATE: WidthData NUMERIC "24"
// Retrieval info: PRIVATE: rden NUMERIC "0"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "ACEX1K"
// Retrieval info: CONSTANT: LPM_ADDRESS_CONTROL STRING "REGISTERED"
// Retrieval info: CONSTANT: LPM_INDATA STRING "REGISTERED"
// Retrieval info: CONSTANT: LPM_OUTDATA STRING "UNREGISTERED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_RAM_DQ"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "24"
// Retrieval info: CONSTANT: LPM_WIDTHAD NUMERIC "5"
// Retrieval info: USED_PORT: address 0 0 5 0 INPUT NODEFVAL address[4..0]
// Retrieval info: USED_PORT: data 0 0 24 0 INPUT NODEFVAL data[23..0]
// Retrieval info: USED_PORT: inclock 0 0 0 0 INPUT NODEFVAL inclock
// Retrieval info: USED_PORT: q 0 0 24 0 OUTPUT NODEFVAL q[23..0]
// Retrieval info: USED_PORT: we 0 0 0 0 INPUT VCC we
// Retrieval info: CONNECT: @address 0 0 5 0 address 0 0 5 0
// Retrieval info: CONNECT: @we 0 0 0 0 we 0 0 0 0
// Retrieval info: CONNECT: q 0 0 24 0 @q 0 0 24 0
// Retrieval info: CONNECT: @inclock 0 0 0 0 inclock 0 0 0 0
// Retrieval info: CONNECT: @data 0 0 24 0 data 0 0 24 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_1.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_1.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_1.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_1.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_1_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_ram_1_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
