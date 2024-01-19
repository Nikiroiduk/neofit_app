import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:neofit_app/data/models/models.dart';
import 'package:neofit_app/domain/user/user_controller.dart';
import 'package:neofit_app/presentation/utils/formz/date_formz.dart';
import 'package:neofit_app/presentation/utils/formz/height_formz.dart';
import 'package:neofit_app/presentation/utils/formz/weight_formz.dart';
import 'package:neofit_app/router/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  bool _isMale = true;
  bool _isKg = true;
  bool _isCm = true;
  DateTime _selectedDate = DateTime.now();
  late final TextEditingController _dateController;
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  late PersonalInfoState _state;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _state = PersonalInfoState();
    _dateController = TextEditingController(text: _state.date.value)
      ..addListener(_onDateChanged);
    _heightController = TextEditingController(text: _state.height.value)
      ..addListener(_onHeightChanged);
    _weightController = TextEditingController(text: _state.weight.value)
      ..addListener(_onWeightChanged);
  }

  void _onDateChanged() {
    _state = _state.copyWith(date: DateFormz.dirty(_dateController.text));
  }

  void _onHeightChanged() {
    _state = _state.copyWith(height: HeightFormz.dirty(_heightController.text));
  }

  void _onWeightChanged() {
    _state = _state.copyWith(weight: WeightFormz.dirty(_weightController.text));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context).personalInformation,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * .02,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            AppLocalizations.of(context)
                                .personalInformationExplanation,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isMale = true;
                        });
                      },
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  width: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant)),
                          elevation: MaterialStateProperty.all<double>(
                              _isMale ? 3 : 0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: Text(
                          AppLocalizations.of(context).male,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.fontSize),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * .03),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isMale = false;
                        });
                      },
                      style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  width: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant)),
                          elevation: MaterialStateProperty.all<double>(
                              _isMale ? 0 : 3),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: Text(
                          AppLocalizations.of(context).female,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.fontSize),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: _heightController,
                      validator: (value) => _state.height
                          .validator(value ?? '')
                          ?.message(AppLocalizations.of(context)),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.height_rounded),
                          suffixIcon: TextButton(
                            onPressed: () {
                              setState(() {
                                _isCm = !_isCm;
                              });
                            },
                            child: Text(_isCm
                                ? AppLocalizations.of(context).cm
                                : AppLocalizations.of(context).ft),
                          ),
                          label: Text(AppLocalizations.of(context).height),
                          hintText: _isCm ? '180' : '5\'11',
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(width: screenWidth * .03),
                  Flexible(
                    child: TextFormField(
                      controller: _weightController,
                      validator: (value) => _state.weight
                          .validator(value ?? '')
                          ?.message(AppLocalizations.of(context)),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.monitor_weight_outlined),
                          suffixIcon: TextButton(
                            onPressed: () {
                              setState(() {
                                _isKg = !_isKg;
                              });
                            },
                            child: Text(_isKg
                                ? AppLocalizations.of(context).kg
                                : AppLocalizations.of(context).lbs),
                          ),
                          label: Text(AppLocalizations.of(context).weight),
                          hintText: _isKg ? '80' : '180',
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .04,
              ),
              TextFormField(
                controller: _dateController,
                validator: (value) => _state.date
                    .validator(value ?? '')
                    ?.message(AppLocalizations.of(context)),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                          onPressed: () => _selectDate(context),
                          icon: const Icon(Icons.calendar_month_rounded)),
                    ),
                    label: Text(AppLocalizations.of(context).birthDay),
                    hintText: AppLocalizations.of(context).ddMMyyyy,
                    border: const OutlineInputBorder()),
              ),
              SizedBox(
                height: screenHeight * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => context.go(Screens.feed.path),
                        child: Text(AppLocalizations.of(context).skip)),
                    Consumer(
                      builder: (context, ref, child) {
                        return ref.watch(userProvider) is UserStateLoading
                            ? const CircularProgressIndicator()
                            : FilledButton(
                                onPressed: () async {
                                  if (!_key.currentState!.validate()) {
                                    return;
                                  }

                                  var user = User(
                                      isMale: _isMale,
                                      height: [
                                        Height(
                                            date: DateTime.now(),
                                            value: double.parse(
                                                _heightController.text))
                                      ],
                                      weight: [
                                        Weight(
                                            date: DateTime.now(),
                                            value: double.parse(
                                                _weightController.text))
                                      ],
                                      birthDay: _selectedDate);
                                  await ref
                                      .read(userProvider.notifier)
                                      .updateUser(user);
                                },
                                child: Text(AppLocalizations.of(context).done));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalInfoState with FormzMixin {
  PersonalInfoState({
    this.date = const DateFormz.pure(),
    this.height = const HeightFormz.pure(),
    this.weight = const WeightFormz.pure(),
  });

  final DateFormz date;
  final HeightFormz height;
  final WeightFormz weight;

  PersonalInfoState copyWith({
    DateFormz? date,
    HeightFormz? height,
    WeightFormz? weight,
  }) {
    return PersonalInfoState(
      date: date ?? this.date,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [date, height, weight];
}
