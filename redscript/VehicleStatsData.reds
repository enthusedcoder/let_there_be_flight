import BaseLib.Hashing.TweakHash

public class VehicleStatsData_Record extends IScriptable {
  public let mass: Float;
  public let comOffset_position: Vector4;
  public let comOffset_orientation: Quaternion;
  public let inertia: Vector3;
}

public class VehicleStatsData extends ScriptableSystem {
    private let m_container: ref<inkHashMap>;

    public func OnAttach() -> Void {
        LogChannel(n"DEBUG", "[VehicleStatsData] attached");
		this.m_container = new inkHashMap();
                
        let record1 = new VehicleStatsData_Record();
        record1.mass = 5065.806;
        record1.inertia = new Vector3(2568.98, 1462.1484, 3085.1343);
        record1.comOffset_position = new Vector4(0.019826656, 0.0084868055, 0.12431084, 0.0);
        record1.comOffset_orientation = new Quaternion(-0.031994995, -0.009442993, -0.00888512, 0.99940395);
        this.Put(t"Vehicle.v_standard2_makigai_maimai_player", record1);
        
        let record2 = new VehicleStatsData_Record();
        record2.mass = 12284.779;
        record2.inertia = new Vector3(23577.398, 5773.1597, 27354.65);
        record2.comOffset_position = new Vector4(-0.0029487698, -0.16552693, -0.10058464, 0.0);
        record2.comOffset_orientation = new Quaternion( -0.023060247, -0.001045868, 0.00025381809, 0.9997335);
        this.Put(t"Vehicle.v_sport2_quadra_type66_nomad_player", record2); // 1700
        this.Put(t"Vehicle.v_sport2_quadra_type66_nomad_ncu_player", record2);

        let record3 = new VehicleStatsData_Record();
        record3.mass = 14542.781;
        record3.inertia = new Vector3(27362.387, 6201.468, 31458.879);
        record3.comOffset_position = new Vector4(-0.0018729233, -0.20424183, -0.15026739, 0.0);
        record3.comOffset_orientation = new Quaternion( -0.01966188, 0.0032170892, 0.00006177465, 0.9998015);
        this.Put(t"Vehicle.v_sport2_quadra_type66_player", record3);
        this.Put(t"Vehicle.v_sport2_quadra_type66_rogue", record3); // 1700
        this.Put(t"Vehicle.v_sport2_quadra_type66_rowley", record3); // 1700
        this.Put(t"Vehicle.v_sport2_quadra_type66_sampson", record3); // 1700
        this.Put(t"Vehicle.v_sport2_quadra_type66_sport", record3);
        this.Put(t"Vehicle.v_sport2_quadra_type66_quest", record3);
        this.Put(t"Vehicle.v_sport2_quadra_type66_poor", record3);
        this.Put(t"Vehicle.v_sport2_quadra_type66_avenger_player", record3); //1830 1750?

        let record4 = new VehicleStatsData_Record();
        record4.mass = 385.22144;
        record4.inertia = new Vector3(70.50331, 31.35365, 67.53408);
        record4.comOffset_position = new Vector4(-0.0038296785, 0.14227042, 0.1929582, 0.0);
        record4.comOffset_orientation = new Quaternion( 0.08842991, -0.010017358, 0.005339184, 0.99601775);
        this.Put(t"Vehicle.v_sportbike2_arch_jackie_player", record4);
        this.Put(t"Vehicle.v_sportbike2_arch_jackie_tuned", record4);
        this.Put(t"Vehicle.v_sportbike2_arch", record4);
        this.Put(t"Vehicle.v_sportbike2_arch_jackie", record4);

    }

	public func Get(tdb: TweakDBID) -> wref<VehicleStatsData_Record> {
		let key: Uint64 = TweakHash.Compute(tdb);
        LogChannel(n"DEBUG", "[VehicleStatsData] getting " + ToString(key));

		return this.m_container.Get(key) as VehicleStatsData_Record;
	}

	public func Put(tdb: TweakDBID, record: ref<VehicleStatsData_Record>) -> Void {
		let key: Uint64 = TweakHash.Compute(tdb);
        LogChannel(n"DEBUG", "[VehicleStatsData] putting " + ToString(key));

		if this.m_container.KeyExist(key) {
			this.m_container.Set(key, record);
		} else {
			this.m_container.Insert(key, record);
		}
	}

	public static func GetInstance(game: GameInstance) -> ref<VehicleStatsData> {
		return GameInstance.GetScriptableSystemsContainer(game).Get(n"VehicleStatsData") as VehicleStatsData;
	}
}