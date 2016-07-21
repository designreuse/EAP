package com.journaldev.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="autopsy_data")
public class Autopsy_data {

	//id属性，主键，唯一，自增
	@Id
	@Column(name="id")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	//品系的id对应strain表的id，是该实验动物所属的品系
	@ManyToOne
    @JoinColumn(name="strain_id")
	private Strain strain_id;
	//测定时的年龄
	private String age;
	//测定性别
	private String sex;
	//测定数量
	private String number;
	//解剖数据分类
	private String autopsy_classification;
	//体高.由肩膊至前肢着地点之间的长度（标明性别、年龄）（犬●）(cm)
	private String body_height;
	//体长●.由鼻端至第一尾椎前缘的长度；猴：测量由顶骨至第一尾椎前缘的长度（标明性别、年龄）(cm)
	private String body_length;
	//尾长●.由骶骨与第一尾椎连接处至最后一尾椎（尾尖）的长度（标明性别、年龄）（不包括禽类）(cm)
	private String tail_length;
	//尾／体比.尾长与体长之比值。（标明性别、年龄）（猴、犬●）
	private String length_body_proportion;
	//体斜长.沿体表测量肩关节至坐骨结节间的长度（标明性别、年龄）（犬●）(cm)
	private String body_inclined_length;
	//耳长.从耳朵的最长处测量（表明性别、年龄）（犬、兔●）(cm)
	private String ear_length;
	//耳宽.从耳朵的最宽处测量（表明性别、年龄）（犬、兔●）(cm)
	private String ear_width;
	//胸宽.左右肩关节之间的直线长度（标明性别、年龄）（犬●）(cm)
	private String chest_width;
	//胸深.由第一胸椎到胸（龙）骨前缘的长度（标明性别、年龄）（犬●）(cm)
	private String chest_depth;
	//躯干长●.由肩胛骨上缘至坐骨结节的长度（标明性别、年龄）；（禽类○）(cm)
	private String stem_length;
	//前肢长●.由肩关节至指尖的长度（标明性别、年龄）（不包括禽类）(cm)
	private String fore_limb_length;
	//后肢长●.由髋关节至趾尖的长度（标明性别、年龄）（不包括禽类）(cm)
	private String posterior_limb_length;
	//骨骼总数●.全身骨骼总数(块)
	private String totality_skeleton;
	//头骨.头部骨骼的数量（犬●）(块)
	private String skull;
	//颈椎●.颈椎数量，，枕骨后至胸廓前的一段脊椎骨为颈椎(个)
	private String cervical_vertebra;
	//胸椎●.胸椎数量， 参与构成胸廓的脊椎骨为胸椎(个)
	private String thoracalis_vertebra;
	//腰椎●.腰椎数量，胸廓后至骶骨前的一段脊椎骨为腰椎(个)
	private String lumbalis_vertebra;
	//骶椎●.骶椎数量，连接腰椎至第一尾椎前愈合为不活动的一段脊椎骨(个)
	private String sacrales_vertebra;
	//尾椎●.尾椎数量，骶椎之后的椎骨为尾椎(个)
	private String coccygeal_vertebra;
	//龙骨长.从龙骨前端到末端的距离（标明性别、年龄）（禽类●）(cm)
	private String bird_sternum_length;
	//股盆宽.两腰角间宽（标明性别、年龄）（禽类●）(cm)
	private String pelvis_width;
	//胫长.从胫部上关节到第三、四趾间的直线距离（标明性别、年龄）（禽类●）(cm)
	private String tibia_length;
	//心●.心重量，心占活体体重的百分比（标明性别、年龄）(mg)
	private String heart;
	//肺●.肺总量，肺占活体体重的百分比（标明性别、年龄）(mg)
	private String lung;
	//肝●.肝重量，肝占活体体重的百分比（标明性别、年龄）(mg)
	private String liver;
	//脾●.脾重量，脾占活体体重的百分比（标明性别、年龄）(mg)
	private String spleen;
	//肾●.肾重量，脾占活体体重的百分比（标明性别、年龄）(mg)
	private String kidney;
	//脑.脑重量，脑占活体体重的百分比（标明性别、年龄）(mg)
	private String brain;
	//甲状腺.甲状腺重量，甲状腺占活体体重的百分比（标明性别、年龄）(mg)
	private String thyroid;
	//肾上腺.肾上腺重量，肾上腺占活体体重的百分比（标明性别、年龄）(mg)
	private String renicapsule;
	//卵巢.卵巢重量，卵巢占活体体重的百分比（标明年龄）(mg)
	private String oarium;
	//睾丸.睾丸重量，睾丸占活体体重的百分比（标明年龄）(mg)
	private String testicle;
	//胸腺.胸腺重量，胸腺占活体体重的百分比（标明性别、年龄）(mg)
	private String thymus_gland;
	//法氏囊.法氏囊重量，法氏囊占活体体重的百分比（标明年龄）（禽类●）(mg)
	private String bursa_of_fabricius;
	//小肠●.小肠长度(cm)
	private String small_intestine;
	//盲肠●.盲肠长度(cm)
	private String caecum;
	//结肠●.结肠长度(cm)
	private String large_intesting;
	//直肠●.直肠长度(cm)
	private String rectum;
	//乳头.雌性哺乳类实验动物胸、腹部乳腺的出口数量(个)
	private String nipple;
	//乳齿.i.c.m/i.c.m  i=乳门齿； c=乳犬齿； m=乳臼齿
	private String milk_tooth;
	//恒齿●.I.C.P.M/I.C.P.M  I=门齿； C=犬齿；P=前臼齿； M=后臼齿（不包括禽类）
	private String permanent_tooth;

	private String time;
			
	public String getId() 
	{
		return id;
	}
	public void setId(String id) 
	{
		this.id = id;
	}
	
	public Strain getStrain_id() 
	{
		return strain_id;
	}
	public void setStrain_id(Strain strain_id) 
	{
		this.strain_id = strain_id;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getAutopsy_classification() {
		return autopsy_classification;
	}
	public void setAutopsy_classification(String autopsy_classification) {
		this.autopsy_classification = autopsy_classification;
	}
	public String getBody_height() {
		return body_height;
	}
	public void setBody_height(String body_height) {
		this.body_height = body_height;
	}
	public String getBody_length() {
		return body_length;
	}
	public void setBody_length(String body_length) {
		this.body_length = body_length;
	}
	public String getTail_length() {
		return tail_length;
	}
	public void setTail_length(String tail_length) {
		this.tail_length = tail_length;
	}
	public String getLength_body_proportion() {
		return length_body_proportion;
	}
	public void setLength_body_proportion(String length_body_proportion) {
		this.length_body_proportion = length_body_proportion;
	}
	public String getBody_inclined_length() {
		return body_inclined_length;
	}
	public void setBody_inclined_length(String body_inclined_length) {
		this.body_inclined_length = body_inclined_length;
	}
	public String getEar_length() {
		return ear_length;
	}
	public void setEar_length(String ear_length) {
		this.ear_length = ear_length;
	}
	public String getEar_width() {
		return ear_width;
	}
	public void setEar_width(String ear_width) {
		this.ear_width = ear_width;
	}
	public String getChest_width() {
		return chest_width;
	}
	public void setChest_width(String chest_width) {
		this.chest_width = chest_width;
	}
	public String getChest_depth() {
		return chest_depth;
	}
	public void setChest_depth(String chest_depth) {
		this.chest_depth = chest_depth;
	}
	public String getStem_length() {
		return stem_length;
	}
	public void setStem_length(String stem_length) {
		this.stem_length = stem_length;
	}
	public String getFore_limb_length() {
		return fore_limb_length;
	}
	public void setFore_limb_length(String fore_limb_length) {
		this.fore_limb_length = fore_limb_length;
	}
	public String getPosterior_limb_length() {
		return posterior_limb_length;
	}
	public void setPosterior_limb_length(String posterior_limb_length) {
		this.posterior_limb_length = posterior_limb_length;
	}
	public String getTotality_skeleton() {
		return totality_skeleton;
	}
	public void setTotality_skeleton(String totality_skeleton) {
		this.totality_skeleton = totality_skeleton;
	}
	public String getSkull() {
		return skull;
	}
	public void setSkull(String skull) {
		this.skull = skull;
	}
	public String getCervical_vertebra() {
		return cervical_vertebra;
	}
	public void setCervical_vertebra(String cervical_vertebra) {
		this.cervical_vertebra = cervical_vertebra;
	}
	public String getThoracalis_vertebra() {
		return thoracalis_vertebra;
	}
	public void setThoracalis_vertebra(String thoracalis_vertebra) {
		this.thoracalis_vertebra = thoracalis_vertebra;
	}
	public String getLumbalis_vertebra() {
		return lumbalis_vertebra;
	}
	public void setLumbalis_vertebra(String lumbalis_vertebra) {
		this.lumbalis_vertebra = lumbalis_vertebra;
	}
	public String getSacrales_vertebra() {
		return sacrales_vertebra;
	}
	public void setSacrales_vertebra(String sacrales_vertebra) {
		this.sacrales_vertebra = sacrales_vertebra;
	}
	public String getBird_sternum_length() {
		return bird_sternum_length;
	}
	public void setBird_sternum_length(String bird_sternum_length) {
		this.bird_sternum_length = bird_sternum_length;
	}
	public String getCoccygeal_vertebra() {
		return coccygeal_vertebra;
	}
	public void setCoccygeal_vertebra(String coccygeal_vertebra) {
		this.coccygeal_vertebra = coccygeal_vertebra;
	}
	public String getPelvis_width() {
		return pelvis_width;
	}
	public void setPelvis_width(String pelvis_width) {
		this.pelvis_width = pelvis_width;
	}
	public String getTibia_length() {
		return tibia_length;
	}
	public void setTibia_length(String tibia_length) {
		this.tibia_length = tibia_length;
	}
	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
	}
	public String getLung() {
		return lung;
	}
	public void setLung(String lung) {
		this.lung = lung;
	}
	public String getLiver() {
		return liver;
	}
	public void setLiver(String liver) {
		this.liver = liver;
	}
	public String getSpleen() {
		return spleen;
	}
	public void setSpleen(String spleen) {
		this.spleen = spleen;
	}
	public String getKidney() {
		return kidney;
	}
	public void setKidney(String kidney) {
		this.kidney = kidney;
	}
	public String getBrain() {
		return brain;
	}
	public void setBrain(String brain) {
		this.brain = brain;
	}
	public String getThyroid() {
		return thyroid;
	}
	public void setThyroid(String thyroid) {
		this.thyroid = thyroid;
	}
	public String getRenicapsule() {
		return renicapsule;
	}
	public void setRenicapsule(String renicapsule) {
		this.renicapsule = renicapsule;
	}
	public String getOarium() {
		return oarium;
	}
	public void setOarium(String oarium) {
		this.oarium = oarium;
	}
	public String getThymus_gland() {
		return thymus_gland;
	}
	public void setThymus_gland(String thymus_gland) {
		this.thymus_gland = thymus_gland;
	}
	public String getTesticle() {
		return testicle;
	}
	public void setTesticle(String testicle) {
		this.testicle = testicle;
	}
	public String getBursa_of_fabricius() {
		return bursa_of_fabricius;
	}
	public void setBursa_of_fabricius(String bursa_of_fabricius) {
		this.bursa_of_fabricius = bursa_of_fabricius;
	}
	public String getSmall_intestine() {
		return small_intestine;
	}
	public void setSmall_intestine(String small_intestine) {
		this.small_intestine = small_intestine;
	}
	public String getCaecum() {
		return caecum;
	}
	public void setCaecum(String caecum) {
		this.caecum = caecum;
	}
	public String getLarge_intesting() {
		return large_intesting;
	}
	public void setLarge_intesting(String large_intesting) {
		this.large_intesting = large_intesting;
	}
	public String getRectum() {
		return rectum;
	}
	public void setRectum(String rectum) {
		this.rectum = rectum;
	}
	public String getNipple() {
		return nipple;
	}
	public void setNipple(String nipple) {
		this.nipple = nipple;
	}
	public String getMilk_tooth() {
		return milk_tooth;
	}
	public void setMilk_tooth(String milk_tooth) {
		this.milk_tooth = milk_tooth;
	}
	public String getPermanent_tooth() {
		return permanent_tooth;
	}
	public void setPermanent_tooth(String permanent_tooth) {
		this.permanent_tooth = permanent_tooth;
	}
	public String getTime() 
	{
		return time;
	}
	public void setTime(String time) 
	{
		this.time = time;
	}
	@Override
	public String toString(){
		return "【id】："+id+", 【发布时间】："+time;
	}
	
	
	
}
