// coin music

(
//1007
SynthDef(\person,
    {
        arg freq, amp, time, age, where;
        var sig, pan, env;
        sig = SinOsc.ar(freq, mul: amp);
        env = EnvGen.kr(Env.perc(0.1, time, curve: age));
        Out.ar(0, Pan2.ar(sig*env, where, amp));
    }
).add;

//Sound 1
SynthDef.new(\di,
	{
		arg freq = 100, panfreq = 1/10, amp = 0.4;
		var sig = LFNoise0.ar(freq);
		var pan = SinOsc.kr(panfreq);
		Out.ar(0, Pan2.ar(sig, pan, amp));
	}
).add;


//Sount 1-1
SynthDef.new(\di_ein,
	{
		arg freq = 100, panfreq = 1/10, amp = 0.4;
		var sig = LFNoise1.ar(freq);
		var pan = SinOsc.kr(panfreq);
		Out.ar(0, Pan2.ar(sig, pan, amp));
	}
).add;

//Sound 1-2
SynthDef.new(\di_perc,
	{
		arg freq = 10000, panfreq = 1/10, amp = 0.3, gate = 1, ff = 900, rq = 0.1;
        var ranfreq = Rand.new(15000, 40000);
        var ranAttime = Rand.new(0.006, 0.3);
		var sig = LFNoise0.ar(ranfreq);
		var pan = SinOsc.kr(panfreq);
		var env = EnvGen.kr(Env.perc(0.01, 0.5), gate, doneAction: 2);
		var fil = RHPF.ar(sig, ff, rq);
		Out.ar(0, Pan2.ar(fil*env, pan, amp));
	}
).add;

//
// SynthDef.new(\di_perc,
// 	{
// 		arg freq = 20000, panfreq = 1/10, amp = 0.3, gate = 1;
// 		var sig = LFNoise0.ar(freq);
// 		var ranAttime = Rand.new(0.006, 0.3);
// 		var pan = SinOsc.kr(panfreq);
// 		var env = EnvGen.kr(Env.pairs([[0, 1], [0.3, ranAttime],  [0.5, 1], [0.99, 0.3], [1.4, 0]], \exp), gate, doneAction: 2);
// 		Out.ar(0, Pan2.ar(sig*env, pan, amp));
// 	}
// ).add;

//Env.pairs([[0, 1], [0.3, 0.5],  [0.5, 0.2], [0.7, 0]], \exp).plot;



//Sound 2-1
SynthDef.new(\zwei,
	{
		arg freq = 100, panfreq = 1/10, amp = 0.2;
		var sig = SinOsc.ar(freq);
		var pan = LFNoise0.kr(panfreq);
		Out.ar(0, Pan2.ar(sig, pan, amp));
	}
).add;

//Sound 2-2
SynthDef.new(\zwei_ein,
	{
		arg freq = 300, panfreq = 2, amp = 0.2;
		var sig = SinOsc.ar(freq);
		var pan = LFNoise1.kr(panfreq);
		Out.ar(0, Pan2.ar(sig, 0, amp));
	}
).add;

//Sound 2-3
SynthDef.new(\zwei_perc,
	{
		arg freq = 29300, panfreq = 2, gate = 1, amp = 0.3;
		var atTime = LFNoise0.kr(20, add: 1);
		var env = EnvGen.kr(Env.perc(atTime/30, 0.3, curve: -4), gate, doneAction: 2);
		var sig = SinOsc.ar(freq);
		var pan = LFNoise1.kr(panfreq);
		Out.ar(0, Pan2.ar(sig*env, pan, amp));
	}
).add;



//Sound 'pap!'
z = Buffer.read(s, "/Users/giy/Desktop/sound_ref/disbody/pap.wav");

x = SynthDef(\pap, {
	arg bufnum, gate = 1, atTime = 0.09, amp = 0.7, rate = 0.2;
	var rrate = Rand.new(0.1, 0.3);
	var tRate = Rand.new(0.003, 0.1);
	var rlTime = Rand.new(0.03, 0.1);
	var sig = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum)*rrate);
//	var env = EnvGen.kr(Env.perc(tRate, rlTime), gate, doneAction: 2);
	var env = EnvGen.kr(Env.perc(atTime, rlTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar(sig*env, 0, amp));
	}
).add;



//0915
SynthDef(\lied,
    {
        |freq = 2600, amp = 0.3, gate = 1, panfreq = 3|
        var sig, env, pansig, out;
        sig = Saw.ar(freq, mul: amp);
        env = EnvGen.kr(Env.adsr(0.1, 0.2, 0.5, 2, 1), gate, doneAction: 2);
        pansig = LFTri.kr(panfreq);
        out = Out.ar(0, Pan2.ar(sig * env, pansig));
    }).add;


SynthDef(\liedL,
    {
        |freq = 2600, amp = 0.3, gate = 1, panfreq = 3|
        var sig, env, pansig, out;
        sig = Saw.ar(freq, mul: amp);
        env = EnvGen.kr(Env.adsr(0.1, 0.2, 0.5, 2, 1), gate, doneAction: 2);
        //env = EnvGen.kr(Env.asr(0.1, 0.2, 0.5), gate, doneAction: 2);
        pansig = LFTri.kr(panfreq, mul: 0.4, add: -0.25);
        out = Out.ar(0, Pan2.ar(sig * env, pansig));
    }).add;


SynthDef(\liedR,
    {
        |freq = 2598, amp = 0.3, gate = 1, panfreq = 3|
        var sig, env, pansig, out;
        sig = Saw.ar(freq, mul: amp);
        env = EnvGen.kr(Env.adsr(0.1, 0.2, 0.5, 2, 1), gate, doneAction: 2);
        //env = EnvGen.kr(Env.asr(0.1, 0.2, 0.5), gate, doneAction: 2);
        pansig = LFTri.kr(panfreq, mul: 0.5, add: 0.25);
        out = Out.ar(0, Pan2.ar(sig * env, pansig));
    }).add;

//new lead - freq를 set 으로 변화 할 때 특별한 효과가 생긴다.
SynthDef(\liedR,
    {
        |freq = 2598, amp = 0.3, gate = 1, efxfreq = 700, panfreq = 3, dronerq = 0.4|
        var sig, env, efx, pansig, out, delay, drone;
        sig = Saw.ar(freq, mul: amp);
        env = EnvGen.kr(Env.adsr(0.1, 0.2, 0.5, 2, 1), gate, doneAction: 2);
        efx = RLPF.ar(sig*env, efxfreq, 0.2, 1);
        drone = RLPF.ar(BrownNoise.ar(0.01), 120, dronerq, 1);
        delay = CombC.ar(efx+drone, 0.2, 0.1, 0.03, 1, efx);
        //env = EnvGen.kr(Env.asr(0.1, 0.2, 0.5), gate, doneAction: 2);
        pansig = LFTri.kr(panfreq, mul: 0.5, add: 0.25);
        out = Out.ar(0, Pan2.ar(delay, pansig));
    }).add;

)


//MEMO
노이즈에 대한 처리(변화 있는 env의 뒤끝?)
멜로디 보다 엠비언트 성격으로.(느리게 흘러가는 코드진행을 만든다고 생각하고.)
멜로디 역할을 하는 것은 더 짧은 음들의 패턴으로.

실재 공연에서는 어느정도 라이브 요소를 섞을까?

유머러스한 요소 : 에릭 사티 같은?

3명이 있다.
차례로 동전 던지기를 한다.
1이 0을 이긴다.

a vs b
첫 번째 결정 : 루트음
a win : 1
b win : 2
a == b : 3

u = Pif(Pfunc({ 0.5.coin }), Pwhite(0, 9, 1), Pwhite(10, 19, 1)).asStream;
i = Pif(Pfunc({ 0.5.coin }), Pwhite(20, 29, 1), Pwhite(30, 39, 1)).asStream;
o = Pif(Pfunc({ 0.5.coin }), Pwhite(40, 49, 1), Pwhite(50, 59, 1)).asStream;

t = Synth(\zwei_ein);

//chord
(
    var a, b, c, key = 0;
    var aa, bb, cc;
    var a2, b2, c2;

/*
    aa = Synth(\zwei_ein, [\amp, 0.2]);
    bb = Synth(\zwei_ein, [\amp, 0.2]);
    cc = Synth(\zwei_ein, [\amp, 0.2]);
*/
    aa = Synth(\liedR, [\amp, 0.05]);
    bb = Synth(\liedR, [\amp, 0.05]);
    cc = Synth(\liedR, [\amp, 0.05]);

fork{
    3020.do{
//        if (0.5.coin, {a = [64, 66].at(1.rand)}, {a = [65, 67].at(1.rand)});
//        if (0.5.coin, {b = [70, 72].at(1.rand)}, {b = [71, 73].at(1.rand)});
//        if (0.5.coin, {c = [76, 77].at(1.rand)}, {c = [79, 80].at(1.rand)});
        if (0.5.coin, {a = 60}, {a = 62});
        if (0.5.coin, {b = 65}, {b = 64});
        if (0.5.coin, {c = 67}, {c = 69});
        ("value a: " + a).postln;
        ("value b: " + b).postln;
        ("value c: " + c).postln;

        if (0.5.coin, {a2 = 5.rand}, {a2 = 5.rand * -1});
        if (0.5.coin, {b2 = 7.rand}, {b2 = 7.rand * -1});
        if (0.5.coin, {c2 = 9.rand}, {c2 = 9.rand * -1});
        ("value a2: " + a2).postln;
        ("value b2: " + b2).postln;
        ("value c2: " + c2).postln;
        (" ").postln;

        /*
        aa.set(\freq, (a).midicps);
        bb.set(\freq, (b).midicps);
        cc.set(\freq, c.midicps);

*/
        aa.set(\freq, (a-key).midicps + a2);
        bb.set(\freq, (b-key).midicps + b2);
		cc.set(\freq, (c-key).midicps + c2);


        4.01.wait;
    }
})



// coin 2
(
    var a, b, c;
    var aa, bb, cc;
    var a2, b2, c2;

    aa = Synth(\zwei_ein, [\amp, 0.2]);
    bb = Synth(\zwei_ein, [\amp, 0.2]);
    cc = Synth(\zwei_ein, [\amp, 0.2]);
/*
    aa = Synth(\pap, [\amp, 0.05]);
    bb = Synth(\pap, [\amp, 0.05]);
    cc = Synth(\pap, [\amp, 0.05]);
*/

fork{
    3020.do{
//        if (0.5.coin, {a = [64, 66].at(1.rand)}, {a = [65, 67].at(1.rand)});
//        if (0.5.coin, {b = [70, 72].at(1.rand)}, {b = [71, 73].at(1.rand)});
//        if (0.5.coin, {c = [76, 77].at(1.rand)}, {c = [79, 80].at(1.rand)});
        if (0.5.coin, {a = 60}, {a = 62});
        if (0.5.coin, {b = 65}, {b = 64});
        if (0.5.coin, {c = 67}, {c = 69});
        ("value a: " + a).postln;
        ("value b: " + b).postln;
        ("value c: " + c).postln;

        if (0.5.coin, {a2 = 5.rand}, {a2 = 5.rand * -1});
        if (0.5.coin, {b2 = 7.rand}, {b2 = 7.rand * -1});
        if (0.5.coin, {c2 = 9.rand}, {c2 = 9.rand * -1});
        ("value a2: " + a2).postln;
        ("value b2: " + b2).postln;
        ("value c2: " + c2).postln;
        (" ").postln;


        aa.set(\freq, (a).midicps);
        bb.set(\freq, (b).midicps);
        cc.set(\freq, c.midicps);


/*		aa.set(\atTime, ((a).midicps + a2)/100);
		bb.set(\atTime, ((b).midicps + b2)/100);
		cc.set(\atTime, (c.midicps + c2)/100);*/


        4.01.rand.wait;
    }
})
